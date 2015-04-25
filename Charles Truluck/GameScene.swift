//
//  GameScene.swift
//  SKTest
//
//  Created by Charles on 4/23/15.
//  Copyright (c) 2015 Charles Truluck. All rights reserved.
//

import UIKit
import SpriteKit
import SceneKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var mainBuilding: SKSpriteNode = SKSpriteNode()
    var buildings = [SKSpriteNode]()
    
    var space: Float = 120
    
    var prevNumber: Float = 0
    var maxRange: Float = 225
    var minRange: Float = -100
    
    var player: SKShapeNode = SKShapeNode(circleOfRadius: 15)
    
    var ground: SKSpriteNode = SKSpriteNode(imageNamed: "Ground")
    
    var playerCatagory: UInt32 = 1
    var buildingCatagory: UInt32 = 2
    
    var pipeSpeed: CGFloat = 2.3
    
    var startTap: Bool = false
    var cancelTouch = false
    
    var groundNode = SKNode()
    
    override func didMoveToView(view: SKView) {
        
        mainBuilding = SKSpriteNode(color: UIColor.greenColor(), size: CGSize(width: view.bounds.size.width / 5, height: self.size.height))
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        self.physicsWorld.contactDelegate = self
        
        player.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.6)
        ground.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height / 16)
        groundNode.position = CGPoint(x: 0, y: self.frame.size.height / 1.8)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(500, 100))
        
        player.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ground.physicsBody!.dynamic = false
        
        player.fillColor = UIColor.yellowColor()
        
        player.physicsBody!.contactTestBitMask = buildingCatagory
        player.physicsBody!.collisionBitMask = buildingCatagory
        player.physicsBody?.dynamic = false
        
        self.addChild(player)
        self.addChild(ground)
        self.spawnPipeRow(0)
        
    }
    func spawnPipeRow(offs: Float) {
        let offset = offs + (space / 2)
        
        let bottomBuilding = (mainBuilding as SKSpriteNode).copy() as! SKSpriteNode
        let topBuilding = (mainBuilding as SKSpriteNode).copy() as! SKSpriteNode
        
        topBuilding.texture = SKTexture(imageNamed: "Pipe")
        bottomBuilding.texture = SKTexture(imageNamed: "Pipe")
        
        let xx = self.size.width
        
        self.setPositionRelativeBot(bottomBuilding, x: xx, y: offset)
        self.setPositionRelativeTop(topBuilding, x: xx, y: offset + space)
        
        topBuilding.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(topBuilding.size.width, topBuilding.size.height))
        bottomBuilding.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(bottomBuilding.size.width, bottomBuilding.size.height))
        
        bottomBuilding.physicsBody?.dynamic = false
        topBuilding.physicsBody?.dynamic = false
        
        bottomBuilding.physicsBody!.contactTestBitMask = playerCatagory
        topBuilding.physicsBody!.contactTestBitMask = playerCatagory
        
        topBuilding.physicsBody!.collisionBitMask = playerCatagory
        bottomBuilding.physicsBody!.collisionBitMask = playerCatagory
        
        buildings.append(bottomBuilding)
        buildings.append(topBuilding)
        
        self.addChild(topBuilding)
        self.addChild(bottomBuilding)
    }
    
    func setPositionRelativeBot(node: SKSpriteNode, x: CGFloat, y: Float) {
        let xx = (CGFloat(node.size.width) / 2) + x
        let yy = Float(self.size.height) / 2 - (Float(node.size.height) / 2) + y
        
        node.position.x = CGFloat(xx)
        node.position.y = CGFloat(yy)
    }
    
    func setPositionRelativeTop(node: SKSpriteNode, x: CGFloat, y: Float) {
        let xx = (CGFloat(node.size.width) / 2) + x
        let yy = Float(self.size.height) / 2 + (Float(node.size.height) / 2) + y
        
        node.position.x = CGFloat(xx)
        node.position.y = CGFloat(yy)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let physicsBody = player.physicsBody where physicsBody.dynamic == false{
            
            player.physicsBody!.dynamic = true
            player.physicsBody!.velocity = CGVectorMake(0, 175)
            startTap = true
        }
        
        if (cancelTouch == false) {
            for touch: AnyObject in touches {
                
                let location = touch.locationInNode(self)
                
                player.physicsBody!.velocity = CGVectorMake(0, 0)
                player.physicsBody!.applyImpulse(CGVectorMake(0, 10))
                
            }
        } else {
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        
        if (startTap) {
            for (var i = 0; i < buildings.count; i++) {
                
                let building = buildings[i]
                
                building.position.x -= pipeSpeed
                
                if (i == buildings.count - 1) {
                    if (building.position.x < self.size.width - building.size.width * 2.0) {
                        self.spawnPipeRow(self.randomOffset())
                    }
                }
            }
        }
    }
    
    func randomOffset() -> Float {
        
        let max = maxRange - prevNumber
        let min = minRange - prevNumber
        
        var randomNumber:  Float = Float(arc4random() % 61) + 40
        var randomBool: Float = Float(arc4random() % 31) + 1
        
        if (randomNumber % 2 == 0) {
            
            var tempNumber = prevNumber + randomNumber
            
            if (tempNumber > minRange) {
                
                tempNumber = minRange - randomNumber
                
            }
            
            randomNumber = tempNumber
            
        } else {
            
            var tempNumber = prevNumber - randomNumber
            
            if (tempNumber < minRange) {
                
                tempNumber = minRange + randomNumber
                
            }
            
            randomNumber = tempNumber
            
        }
        
        prevNumber = randomNumber
        
        return randomNumber

    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        if (startTap) {
            player.physicsBody!.velocity = CGVectorMake(0, 0)
            
            for pi in buildings {
                pi.physicsBody = nil
                player.physicsBody?.dynamic = false
                pipeSpeed = 0
                cancelTouch = true
            }
        }
    }
}








