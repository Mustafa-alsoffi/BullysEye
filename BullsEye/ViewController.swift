//
//  ViewController.swift
//  BullsEye
//
//  Created by Mustafa Alsoffi on 28/10/2018.
//  Copyright © 2018 Mustafa Alsoffi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue : Int = 0
    var score = 0
    var rounds = 0
    
    
    
    
    
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var linkDisplay: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var roundNumber: UILabel!
    @IBOutlet weak var startOverButton: UIButton!
   

    override func viewDidLoad() {
        super.viewDidLoad()

        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlited = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlited, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)

   
    
    }
    @IBAction func showAlert () {
      
   let difference = abs (targetValue - currentValue)
   var points = 100 - difference
        score += points
        
        let tital: String
        
        if difference == 0 {
            
         
          
            tital = "Perfect!"
            points += 100
            
        } else if difference < 5 {
            
    
            tital = "You almost had it!!"
            if difference == 1 {
                points += 50
            }
            
        } else if difference < 10 {
            
            tital = "Pretty good"
            
        } else {
            
            tital = "Not even close"
                    }
        
        
        let message = "You scored \(points) points!!" + "\n current value is:  \(currentValue)"
        
        let alert = UIAlertController (title: tital, message:  message, preferredStyle: .alert)
        let Action = UIAlertAction (title: "Ok", style: .default, handler: {
            Action in
            self.startNewGame()
        })
        
        alert.addAction(Action)
        
        present(alert, animated: true, completion: nil)
        
      }
    
    @IBAction func sliderMoved (_ slider: UISlider) {
    
       
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
        
        }
    
    func startNewGame(){
        
        rounds += 1
        
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLables ()
        }
    
    func updateLables (){
      
        
        linkDisplay.text = String(targetValue)
        totalScore.text = String(score)
        roundNumber.text = String(rounds)
        
        
        }
    
    @IBAction func startOverTapped () {
        score = 0
        rounds = 0
        startNewGame()

    
        
}
    
    
    }
     

    
    

 




