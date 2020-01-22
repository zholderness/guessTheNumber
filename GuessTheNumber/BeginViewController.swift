//
//  BeginViewController.swift
//  GuessTheNumber
//
//  Created by Zoe Holderness on 1/20/20.
//  Copyright © 2020 Zoe Holderness. All rights reserved.
//

import UIKit

class BeginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "goToSignUp", sender: self)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "goToLogin", sender: self)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
