//
//  SpellDetailVC.swift
//  
//
//  Created by Timothy Yang on 4/1/19.
//

import UIKit
import AVFoundation
class SpellDetailVC: UIViewController {

    @IBOutlet weak var spellNameLabel: UILabel!
    @IBOutlet weak var spellDescriptionLabel: UILabel!
    @IBOutlet var spellGesture: UISwipeGestureRecognizer!
    
    var spell = SpellData()
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        spellNameLabel.text = spell.name
        spellDescriptionLabel.text = spell.description
    }
    @IBAction func spellGestureSwiped(_ sender: Any) {
        playSound(soundName: spell.soundFile, audioPlayer: &audioPlayer)
    }
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("\(soundName) could not be played as a sound")
            }
        } else {
            //sound no work
            print("did not load sound file: \(soundName)")
        }
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("\(soundName) could not be played as a sound")
            }
        } else {
            //sound no work
            print("did not load sound file: \(soundName)")
        }
    }
    
    
}
