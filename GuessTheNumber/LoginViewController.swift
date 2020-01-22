//
//  LoginViewController.swift
//  GuessTheNumber
//
//  Created by Zoe Holderness on 1/20/20.
//  Copyright © 2020 Zoe Holderness. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
    var loginref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginref = Database.database().reference()
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        guard let email = emailLogin.text else {
            return
        }
        guard let password = passwordLogin.text else {
            return
        }
        /*
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }}
        if let error = error {
          strongSelf.showMessagePrompt(error.localizedDescription)
          return
        }
 */
        self.performSegue(withIdentifier: "loginToGame", sender: self)
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
