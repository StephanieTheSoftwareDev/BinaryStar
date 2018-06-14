//
//  GameScene.swift
//  starWarsFlight
//
//  Created by Stephanie Fischer on 5/3/18.
//  Copyright © 2018 Stephanie Fischer. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    var movingShip = SKSpriteNode()
    var motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    
    
    
    override func sceneDidLoad() {
        movingShip = SKSpriteNode(imageNamed: "ship")
        
//        movingShip = SKSpriteNode(imageNamed: "ship")
//        self.addChild(movingShip)
//
//        self.lastUpdateTime = 0
//        if motionManager.isDeviceMotionAvailable {
//            print("We can detect device motionGameScene")
//            startReadingMotionData()
//        }
//        else {
//            print("We cannot detect device motion")
//        }
//
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        
    }
    
    

    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
//    func startReadingMotionData() {
//        // set read speed
//        motionManager.deviceMotionUpdateInterval = 0.02
//        // start reading
//        motionManager.startDeviceMotionUpdates(to: opQueue) {
//            (data: CMDeviceMotion?, error: Error?) in
//
//            if let mydata = data {
//
//                print("pitch", self.degrees(mydata.attitude.pitch))
//                let speed = CGFloat(self.degrees(mydata.attitude.pitch) / 3)
//                self.updateShipLocation(num: speed)
//
//
//            }
//        }
//    }
//
//    func degrees(_ radians: Double) -> Double {
//        return -180/Double.pi * radians
//    }
//    func updateShipLocation(num: CGFloat) {
//        DispatchQueue.main.async {
//            print("UpdateShipLocation Function")
//            let x = self.movingShip.frame.minX
//            self.movingShip.frame = CGRect(x: x + (num), y: 230, width: self.movingShip.frame.size.width, height: self.movingShip.frame.size.height)
//        }
//    }
    
    
    
}
