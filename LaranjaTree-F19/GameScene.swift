//
//  GameScene.swift
//  LaranjaTree-F19z
//
//  Created by Himanshu Mehta on 2019-10-11.
//  Copyright © 2019 Himanshu Mehta. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    // MARK: Sprites
    // --------------------------------------
    var ground:SKSpriteNode!
    
    // ???? orange, tree, ground, wall
    
    // WRITE THE CODE TO MAKE AN ORANGE
    // WHEN PERSON CLICKS ON SCREEN
    
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        
        // setup ground sprite
        self.ground = self.childNode(withName: "ground") as! SKSpriteNode
        
        self.ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        self.ground.physicsBody?.affectedByGravity = false
        self.ground.physicsBody?.categoryBitMask = 32
        self.ground.physicsBody?.collisionBitMask = 0
        self.ground.physicsBody?.contactTestBitMask = 0
        
        
        
        
        
    }
    override func update(_ currentTime: TimeInterval) {
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print("collision occured")
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (nodeA == nil || nodeB == nil) {
            return
        }
        
        print("COLLISION DETECTED")
        print("Sprite 1: \(nodeA!.name)")
        print("Sprite 2: \(nodeB!.name)")
        print("------")
        
        //        if (nodeA!.name == "player" && nodeB!.name == "enemy") {
        //            // player die
        //            print("RESETTING POSITION-AAAA")
        //            restartPlayer()
        //        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touched the screen")
        
        // GET THE POSITION WHERE THE MOUSE WAS CLICKED
        // ---------------------------------------------
        let mouseTouch = touches.first
        if (mouseTouch == nil) {
            return
        }
        let location = mouseTouch!.location(in: self)
        let mouseXPosition = location.x
        let mouseYPosition = location.y
        
        
        // detect what sprite was touched
        let nodeTouched = atPoint(location).name
        if (nodeTouched == "tree") {
            spawnOrange(x: mouseXPosition, y: mouseYPosition)
        }
    }
    
    // make your orange
    func spawnOrange(x:CGFloat, y:CGFloat) {
        
        // DRAW THE ORANGE
        //------------------------------
        // 1. make an orange
        let orange = SKSpriteNode(imageNamed: "Orange")
        // 2. Position the orange on the scren
        orange.position.x = x
        orange.position.y = y
        // 3. Force orange to always appear in foreground
        orange.zPosition = 999
        
        // 4. show the orange on screen
        addChild(orange)
        
        // ADD PHYSICS TO THE ORANGE
        // ---------------------------
        // 1. Give the orange a physics body
        orange.physicsBody = SKPhysicsBody(circleOfRadius: orange.size.width / 2)
        // 2. Give orange gravity. By default, orange is affected by gravity.
        // orange.physicsBody?.affectedByGravity = true
        // 3. Set category, collision, and contact bit masks
        //  - By default, collison = everything, contact = 0
        orange.physicsBody?.categoryBitMask = 1
        orange.physicsBody?.contactTestBitMask = 0
        
        orange.physicsBody?.restitution = 1
    }
}
