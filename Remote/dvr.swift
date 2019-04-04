//
//  dvr.swift
//  Remote
//
//  Created by oleg on 2/26/19.
//  Copyright © 2019 DePaul University. All rights reserved.
//

import UIKit

class dvr: UIViewController {
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var pauseB: UIButton!
    @IBOutlet weak var playB: UIButton!
    @IBOutlet weak var rewindB: UIButton!
    @IBOutlet weak var forwardB: UIButton!
    
    @IBOutlet weak var stopB: UIButton!
    @IBOutlet weak var recordB: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        state.text = ""
        if (state.text == "Playing"){
            // enable pause, fast forward or rewind
        }   // else disable those buttons
        if (state.text == "Stopped"){
            
        }
    }
    
    
    @IBAction func play(_ sender: UIButton) {
        state.text = "Playing"
        rewindB.isEnabled = true;
        forwardB.isEnabled = true;
        pauseB.isEnabled = true;
        recordB.isEnabled = false;
    }
    
    @IBAction func pause(_ sender: UIButton) {
        state.text = "Paused"
    }
    
    @IBAction func stop(_ sender: UIButton) {
        state.text = "Stopped"
        rewindB.isEnabled = true;
        forwardB.isEnabled = true;
        pauseB.isEnabled = true;
        playB.isEnabled = true;
        recordB.isEnabled = true;
    }
    
    @IBAction func rewind(_ sender: UIButton) {
        if (state.text == "Playing") {
            state.text = "Fast Rewinding"
        } else {
            rewindB.isEnabled = false;
            // send a popup suggesting that we should play first
        }
    }
    
    @IBAction func record(_ sender: UIButton) {
        state.text = "Recording"
        rewindB.isEnabled = false;
        forwardB.isEnabled = false;
        pauseB.isEnabled = false;
        playB.isEnabled = false;
    }
    
    @IBAction func forward(_ sender: UIButton) {
        state.text = "Fast Forwarding"
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if (!sender.isOn) {
            playB.isEnabled = false;
            pauseB.isEnabled = false;
            rewindB.isEnabled = false;
            forwardB.isEnabled = false;
            recordB.isEnabled = false;
            stopB.isEnabled = false;
        } else {
            playB.isEnabled = true;
            pauseB.isEnabled = true;
            rewindB.isEnabled = true;
            forwardB.isEnabled = true;
            recordB.isEnabled = true;
            stopB.isEnabled = true;
        }
        switchLabel.text = "Power " + (sender.isOn ? "On" : "Off")
        powerSwitch.setOn(sender.isOn, animated: true)
        state.text = ""
    }
    
}
