//
//  SignUpViewController.swift
//  GuessTheNumber
//
//  Created by Zoe Holderness on 1/20/20.
//  Copyright © 2020 Zoe Holderness. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    var loginref: DatabaseReference!
    
    @IBOutlet weak var nameSignUp: UITextField!
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        loginref = Database.database().reference()
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        let name = nameSignUp.text
        guard let email = emailSignUp.text else{
            //show("No email to submit", sender: <#Any?#>)
            return
        }
        guard let password = passwordSignUp.text else {
           // show("No password to submit", sender: <#Any?#>)
            return
        }
        Auth.auth().createUser(withEmail: email, password: password)
        performSegue(withIdentifier: "goToGuessFromSignUp", sender: self)
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
