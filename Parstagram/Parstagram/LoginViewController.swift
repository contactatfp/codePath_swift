//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Kyle Louderback on 3/23/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
        let username = username.text!
        let password = password.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { user, error in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("error \(error!.localizedDescription)")
            }
        }
       
    }
    @IBAction func signUp(_ sender: Any) {
        let user = PFUser()
        user.username = username.text
        user.password = password.text
        
        user.signUpInBackground { success, error in
            if success{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("failed login: \(error!.localizedDescription)")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
