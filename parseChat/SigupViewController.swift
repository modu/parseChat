//
//  SigupViewController.swift
//  parseChat
//
//  Created by Varun Vyas on 04/02/16.
//  Copyright © 2016 Varun Vyas. All rights reserved.
//

import UIKit
import Parse

class SigupViewController: UIViewController {
    @IBOutlet weak var UserName: UITextField!

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(sender: AnyObject) {
        let user = PFUser()
        
        user.username = self.UserName.text
        user.password = self.password.text
        user.email = self.email.text
        
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                print("Error Worked!!")
            } else {
                // Hooray! Let them use the app now.
                print("User Created ")
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
