//
//  signupViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class signupViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var descr: UITextView!

    @IBAction func signup(sender: AnyObject) {
        
        let user = PFUser()
        user.username = username.text
        user.password = password.text
        user.email = email.text
        

        user.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
            
            if ((error) != nil) {
                var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                
            } else {
                
                if (self.descr.text == nil) {
                    
                    self.descr.text = ""
                }
                if (PFUser.currentUser()?.username != "p") {
                    let user = PFUser.currentUser()
                    user!.setValue(self.descr.text, forKey: "description")
                    user!.saveInBackgroundWithBlock {
                        (succeeded: Bool!, error: NSError?) -> Void in
                        if error == nil {
                        } else {
                        }
                    }
                }

                var alert = UIAlertView(title: "Success", message: "Signed Up", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("start") as! UIViewController
                    self.presentViewController(viewController, animated: true, completion: nil)
                })
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
