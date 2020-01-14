//
//  SecondViewController.swift
//  ShadowPlayer
//
//  Created by Shadow Song on 1/13/20.
//  Copyright © 2020 Shadow Song. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func play(_ sender: Any)
    {
        if audioStuffed && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any)
    {
        if audioStuffed && audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    
    @IBAction func prev(_ sender: Any)
    {
        if audioStuffed && thisSong > 0
        {
            playThis(thisOne: songs[thisSong - 1])
            thisSong -= 1
            //print(thisSong)
            label.text = songs[thisSong]
        }
    }
    
    @IBAction func next(_ sender: Any)
    {
        if audioStuffed && thisSong < songs.count - 1
        {
            playThis(thisOne: songs[thisSong + 1])
            thisSong += 1
            //print(thisSong)
            label.text = songs[thisSong]
        }
    }
    
    @IBAction func slider(_ sender: UISlider)
    {
        if audioStuffed
        {
            audioPlayer.volume = sender.value
        }
    }
    
    func playThis(thisOne: String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print("ERROR")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = songs[thisSong]
        
        //This part of code allows playing in background/locked screen.
        let session = AVAudioSession.sharedInstance()
         do{
            try session.setCategory(AVAudioSession.Category.playback)
         }
         catch{
         }
    }


}

