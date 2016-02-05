//
//  ViewController.swift
//  parseChat
//
//  Created by Varun Vyas on 04/02/16.
//  Copyright © 2016 Varun Vyas. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logIn(sender: AnyObject) {
    
        PFUser.logInWithUsernameInBackground(emailTextField.text!, password:passwordTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
        
            if user != nil {
               print("user is not nill")
                
                var alert = UIAlertView(title: "Success", message: "Logged In", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChatModel") as! UIViewController
                    self.presentViewController(viewController, animated: true, completion: nil)
                })
                
                
                // Do stuff after successful login.
            } else {
                print("user is nill")
                var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                // The login failed. Check error to see why.
            }
        }
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let detailsviewController = segue.destinationViewController as! ChatViewController
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //NSLog(" Prepare for segue ")
    }

    


}

