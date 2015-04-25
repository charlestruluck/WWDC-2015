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

class GameScene: SKScene {
    
    var mainPipe: SKSpriteNode = SKSpriteNode()
    var pipes = [SKSpriteNode]()
    
    var space: Float = 90
    
    var prevNumber: Float = 0
    var maxRange: Float = 225
    var minRange: Float = -225
    
    var player: SKShapeNode = SKShapeNode(circleOfRadius: 15)
    var ground: SKShapeNode = SKShapeNode(rectOfSize: CGSizeMake(500, 100))
    
    var groundNode = SKNode()
    
    override func didMoveToView(view: SKView) {
        
        mainPipe = SKSpriteNode(color: UIColor.greenColor(), size: CGSize(width: view.bounds.size.width / 5, height: self.size.height))
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        player.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.6)
        ground.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height / 16)
        groundNode.position = CGPoint(x: 0, y: self.frame.size.height / 1.8)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(500, 100))
        
        player.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ground.physicsBody!.dynamic = false
        
        player.fillColor = UIColor.yellowColor()
        ground.fillColor = UIColor.blueColor()
        
        self.addChild(player)
        self.addChild(ground)
        self.spawnPipeRow(0)
        
    }
    func spawnPipeRow(offs: Float) {
        let offset = offs + (space / 2)
        
        let bottomPipe = (mainPipe as SKSpriteNode).copy() as! SKSpriteNode
        let topPipe = (mainPipe as SKSpriteNode).copy() as! SKSpriteNode
        
        let xx = self.size.width
        
        self.setPositionRelativeBot(bottomPipe, x: xx, y: offset)
        self.setPositionRelativeTop(topPipe, x: xx, y: offset + space)
        
        topPipe.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(topPipe.size.width, topPipe.size.height))
        bottomPipe.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(bottomPipe.size.width, bottomPipe.size.height))
        
        bottomPipe.physicsBody!.dynamic = false
        topPipe.physicsBody!.dynamic = false
        
        pipes.append(bottomPipe)
        pipes.append(topPipe)
        
        self.addChild(topPipe)
        self.addChild(bottomPipe)
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
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            player.physicsBody!.velocity = CGVectorMake(0, 0)
            player.physicsBody!.applyImpulse(CGVectorMake(0, 10))
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        
        for (var i = 0; i < pipes.count; i++) {
            
            let pipe = pipes[i]
            
            pipe.position.x -= 5
            
            if (i == pipes.count - 1) {
                if (pipe.position.x < self.size.width - pipe.size.width * 2.0) {
                    self.spawnPipeRow(self.randomOffset())
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
}








