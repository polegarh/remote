//
//  favorites.swift
//  Remote
//
//  Created by oleg on 3/5/19.
//  Copyright © 2019 DePaul University. All rights reserved.
//

import UIKit

class favorites: UIViewController {
    var data = Data()
    
    @IBOutlet weak var button_number: UISegmentedControl!
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var channel: UILabel!
    @IBOutlet weak var cursor: UISegmentedControl!
    var x : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        x = Int(channel.text!)!
    }

    @IBAction func inc_dec(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0){
            x = x - 1
        } else {
            x = x + 1
        }
        channel.text = String(x)
        sender.selectedSegmentIndex = -1
    }
    
    @IBAction func save(_ sender: UIButton) {
        // pop up to ask are you sure then save new fav channel
        if let x = label.text, let y = channel.text{
            // checking label containing digits
            let decimalCharacters = CharacterSet.decimalDigits
            let decimalRange = x.rangeOfCharacter(from: decimalCharacters)
            
            if (x.count < 5 && x.count > 0) && (y.count < 3 && y.count > 0 && y != "00") && decimalRange == nil{
                data.setFavTag(x: Int(channel.text!)!)
                data.setFavIndex(x: button_number.selectedSegmentIndex)
                data.setFavLabel(x: label.text!)
                self.x = 0
                // popup about saving
                let title = "Are you sure you would like to proceed?"
                let message = "You wanted to save channel \(self.channel.text!) as \(self.label.text!)"
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
                
                let cancelAction = UIAlertAction(title: "Go Back", style: .destructive) { action in
                    let cancelController = UIAlertController(title: "No Problem", message: "Everything is saved", preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                    cancelController.addAction(okayAction)
                    self.present(cancelController, animated: true, completion: nil)
                }
                let confirmAction = UIAlertAction(title: "Confirm", style: .default) { action in
                    let okayController = UIAlertController(title: "Okay", message: "The channel \(self.channel.text!) is saved as \( self.label.text!) in your favorites", preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                    okayController.addAction(okayAction)
                    self.present(okayController, animated: true, completion: nil)
                    self.label.text = ""
                    self.channel.text = ""
                    self.x = 0
                }
                alertController.addAction(cancelAction)
                alertController.addAction(confirmAction)
                present(alertController, animated: true, completion: nil)
            } else {
                // return popup
                let alertController = UIAlertController(title: "Illegal Inputs", message: "The Channel should be between 0-99 and its label should be 1-4 letters long. Please try again", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                self.label.text = ""
                self.channel.text = ""
                self.x = 0
            }
        }
        
    }
    
    
    
    
    @IBAction func cancel(_ sender: UIButton) {
        // pop up to ask are you sure
        let title = "Are you sure you would like to cancel?"
        let message = "You wanted to save channel \(String(describing: self.channel.text)) as \(String(describing: self.label.text))"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

        let cancelAction = UIAlertAction(title: "Go Back", style: .destructive) { action in
            let cancelController = UIAlertController(title: "No Problem", message: "Everything is saved", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            cancelController.addAction(okayAction)
            self.present(cancelController, animated: true, completion: nil)
        }
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { action in
            let okayController = UIAlertController(title: "Okay", message: "Try again", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            okayController.addAction(okayAction)
            self.present(okayController, animated: true, completion: nil)
            self.label.text = ""
            self.channel.text = ""
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
}
