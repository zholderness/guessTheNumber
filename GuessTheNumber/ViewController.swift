//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Zoe Holderness on 1/8/20.
//  Copyright © 2020 Zoe Holderness. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    var ref: DatabaseReference!
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
        print("Number to Guess:\(numberToGuess)")
        // let key be the number to guess
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        generateRandomNumber()
     
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                validateGuess(guessInt)

            }
        }
        print("The random number is \(numberToGuess)")
    }
    
    func validateGuess(_ guess: Int) {
        
        // Joseph's Edit
        if numberOfGuesses > 5 {
            let alert = UIAlertController(title: "Oh Nooo!", message: "You lost!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Play again", style: .default, handler:nil)
            alert.addAction(action)
            self.present(alert, animated:true, completion: nil)
            numberOfGuesses = 0
            // Restart game
            generateRandomNumber()
        }
        
        
        
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
            //print("Your guess should be between 1 and 100")
        } else if guess < numberToGuess {
            guessLabel.text = "Higher!"
        } else if guess > numberToGuess {
            guessLabel.text = "Lower!"
        } else {
            showWinsAlert()
            let score = ["numberToguess":numberToGuess,
                         "fewestGuesses": numberOfGuesses]
            self.ref.child("Guessing_Numbers").setValue(score)
            //print("You Win!!")
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
   
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .default, handler:nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinsAlert(){
        let alert = UIAlertController(title: "Congrats!", message: "You won with a total of \(numberOfGuesses) guesses", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play again", style: .default, handler:nil)
        alert.addAction(action)
        self.present(alert, animated:true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

