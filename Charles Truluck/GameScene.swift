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
    
    var playerCircle: SKShapeNode = SKShapeNode(circleOfRadius: 15)
    
    var mainPipe: SKSpriteNode = SKSpriteNode()
    var pipes = [SKSpriteNode]()
    
    var space: Float = 90
    
    var prevNumber: Float = 0
    var maxRange: Float = 225
    var minRange: Float = -225
    
    override func didMoveToView(view: SKView) {
        
        mainPipe = SKSpriteNode(color: UIColor.greenColor(), size: CGSize(width: view.bounds.size.width / 5, height: self.size.height))
        
        playerCircle.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        playerCircle.physicsBody!.dynamic = false
        
        playerCircle.zPosition = 9
        playerCircle.lineWidth = 0
        
        playerCircle.fillColor = UIColor.yellowColor()
        playerCircle.position = CGPoint(x: 150, y: 150)
        
        self.spawnPipeRow(0)
        self.addChild(playerCircle)
        
    }
    
    func spawnPipeRow(offs: Float) {
        let offset = offs + (space / 2)
        
        let bottomPipe = (mainPipe as SKSpriteNode).copy() as! SKSpriteNode
        let topPipe = (mainPipe as SKSpriteNode).copy() as! SKSpriteNode
        
        let xx = self.size.width
        
        self.setPositionRelativeBot(bottomPipe, x: xx, y: offset)
        self.setPositionRelativeTop(topPipe, x: xx, y: offset + space)
        
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
    }
   
    override func update(currentTime: CFTimeInterval) {
        
        for (var i = 0; i < pipes.count; i++) {
            
            let pipe = pipes[i]
            
            pipe.position.x -= 3
            
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
            
            var tempNumber = prevNumber - randomNumber
            
            if (tempNumber < minRange) {
                
                tempNumber = minRange + randomNumber
                
            }
            
            randomNumber = tempNumber
            
        } else {
            
            var tempNumber = prevNumber + randomNumber
            
            if (tempNumber > minRange) {
                
                tempNumber = minRange - randomNumber
                
            }
            
            randomNumber = tempNumber
            
        }
        
        prevNumber = randomNumber
        
        return randomNumber
        
    }
}








