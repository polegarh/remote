//
//  ViewController.swift
//  Remote
//
//  Created by oleg on 2/11/19.
//  Copyright © 2019 DePaul University. All rights reserved.
//

import UIKit
var data = Data()

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var fav_3: UIButton!
    @IBOutlet weak var fav_2: UIButton!
    @IBOutlet weak var fav_1: UIButton!
    @IBOutlet weak var fav_0: UIButton!
    @IBOutlet weak var Section: UILabel!
    //@IBOutlet weak var channel: UIButton!
    @IBOutlet weak var slideBar: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var inc: UIButton!
    @IBOutlet weak var dec: UIButton!
    @IBOutlet weak var channel_section: UILabel!
    
    @IBOutlet weak var calcl: UIStackView!
    @IBOutlet weak var calc2: UIStackView!
    @IBOutlet weak var calc3: UIStackView!
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    var ChannelOnScreen: Int = 0; // keeping track of current number
    var performingMath = false;     // false if multiple digit numbers && true if operator
    
    @IBOutlet weak var channel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValue.text = "Volume \(Int(slideBar.value))"
        print(data.getFavTag())
        if (data.getFavTag() != 0){
            if (data.getFavIndex() == 0) {
                fav_0.setTitle(data.getFavLabel(), for: .normal)
                fav_0.tag = data.getFavTag()
            } else if (data.getFavIndex() == 1) {
                fav_1.setTitle(data.getFavLabel(), for: .normal)
                fav_1.tag = data.getFavTag()
            } else if (data.getFavIndex() == 2) {
                fav_2.setTitle(data.getFavLabel(), for: .normal)
                fav_2.tag = data.getFavTag()
            } else {
                fav_3.setTitle(data.getFavLabel(), for: .normal)
                fav_3.tag = data.getFavTag()
            }
        }
    }
    
    // this function is for numbers only
    @IBAction func numbers(_ sender: UIButton) {
//        if (powerSwitch.isOn) {sender.isEnabled = true} else { sender.isEnabled = false; }
        if performingMath == false && channel.text != "" { channel.text = "";
            
        }
        if  performingMath == true {
            channel.text = String(sender.tag-1)
            ChannelOnScreen = Int(channel.text!)!
            performingMath = false
        } else {
            channel.text = channel.text! + String(sender.tag-1);
            ChannelOnScreen = Int(channel.text!)! + sender.tag-1;
            performingMath = true;
        }
    }
    
    
    @IBAction func inc(_ sender: UIButton) {
        ChannelOnScreen = ChannelOnScreen + 1;
        channel.text = String(ChannelOnScreen);
        performingMath = true;
    }
    
    @IBAction func dec(_ sender: UIButton) {
        ChannelOnScreen = ChannelOnScreen - 1;
        channel.text = String(ChannelOnScreen);
        performingMath = true;
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        sliderValue.text = "Volume \(Int(sender.value))"
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        switchLabel.text = "Power " + (sender.isOn ? "On" : "Off")
        powerSwitch.setOn(sender.isOn, animated: true)
        if (sender.isOn) {
            inc.isEnabled = true;
            dec.isEnabled = true;
            slideBar.isEnabled = true;
        } else {
            // not sure how to disable all numbers and channels
            inc.isEnabled = false;
            dec.isEnabled = false;
            slideBar.isEnabled = false;
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            inc.isHidden = true;
            dec.isHidden = true;
            calcl.isHidden = true;
            calc2.isHidden = true;
            calc3.isHidden = true;
            channel_section.isHidden = true;
        } else {
            inc.isHidden = false;
            dec.isHidden = false;
            calcl.isHidden = false;
            calc2.isHidden = false;
            calc3.isHidden = false;
            channel_section.isHidden = false;
        }
    }
}

