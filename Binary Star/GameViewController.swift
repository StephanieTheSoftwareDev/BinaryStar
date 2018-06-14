//
//  GameViewController.swift
//  starWarsFlight
//
//  Created by Stephanie Fischer on 5/3/18.
//  Copyright © 2018 Stephanie Fischer. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreMotion
import AVFoundation

class GameViewController: UIViewController, AVAudioPlayerDelegate {
    
    var motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    var animator : UIDynamicAnimator?
    var audioPlayer : AVAudioPlayer!
    
    @IBOutlet weak var movingShip: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound()
//        if motionManager.isDeviceMotionAvailable {
//            print("We can detect device motion")
//            startReadingMotionData()
//        }
//        else {
//            print("We cannot detect device motion")
//        }
        
        if let view = self.view as? SKView {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
        }

    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
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
//            let x = self.movingShip.frame.minX
//            self.movingShip.frame = CGRect(x: x + (num), y: 230, width: self.movingShip.frame.size.width, height: self.movingShip.frame.size.height)
//        }
//    }
    func playSound() {
        let soundURL = Bundle.main.url(forResource: "giuliosSong", withExtension: "m4a")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error)
        }
        audioPlayer.play()
    }
}
