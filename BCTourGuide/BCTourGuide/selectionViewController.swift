//
//  selectionViewController.swift
//  BCTourGuide
//
//  Created by montserratloan on 4/22/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import UIKit
import AVFoundation

class selectionViewController: UIViewController, UIAlertViewDelegate {

  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var message: UILabel!
  var audioPlayer = AVAudioPlayer()
  
  override func viewDidLoad() {
        super.viewDidLoad()

       showAlert()
    }
  func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
    if let sound = NSDataAsset (name: soundName) {
      do {
        try audioPlayer = AVAudioPlayer(data: sound.data)
        audioPlayer.play()
      } catch {
        print("ERROR: file \(soundName) couldn't be played as a sound.")
      }
    } else {
      print("ERROR: data in \(soundName) couldn't be played as a sound.")
    }
  }

  
  func showAlert() {
    var alertView = UIAlertView(title: "*** ERROR", message: "Augmented Reality Breached", delegate: self as UIAlertViewDelegate, cancelButtonTitle: "Continue", otherButtonTitles: "")
    
    alertView.tag = 1
    
    playSound(soundName: "sound0", audioPlayer: &audioPlayer)
    alertView.show()
    
  }
  
  
}

