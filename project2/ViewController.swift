//
//  ViewController.swift
//  project2
//
//  Created by Chris Gonzaga on 3/15/18.
//  Copyright © 2018 Chris Gonzaga324243. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var totalScore: UILabel!
    
    @IBOutlet weak var questionText: UITextField!
    
    var countries = [String]() // all set in view did control,  notice we can set "Ints" on it since array's positions are numbers
    var correctAnswer = 0
    var score = 0 // type inference
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        
        
        askQuestion() // will be pressed only once when the program has loaded
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String] //shuffles, no upper bound
            // Randomed, then the array's outcome are set into the buttons, with data arrayed, 0-2.
        button1.setImage(UIImage(named: countries [0]), for: .normal) // outcomes of arrays, are stored into here.
        button2.setImage(UIImage(named: countries [1]), for: .normal)
        button3.setImage(UIImage(named: countries [2]),for: .normal) //
         // 1-3, with storeage of array position 0-2, and button tag 0-2
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3) // returns 1, with upper bound to 3
        title = countries[correctAnswer].uppercased() // just want title to be correct case
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag ==  correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        // the score is on order
        
        // title will be on top "Correct", which was passed in the UIALERT, and it's a title a line, then message....then a button, add action.// this is general on bottom(message) // also why it's important to put code in order, title will be processed above first, then sends into bottom
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion)) // bottom button
        present(ac, animated: true)
        
        totalScore.text = "Score: \(score)" // i put this code at the end since i want it to be score last ended
        // total score was updated first if put on top
    }
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
















