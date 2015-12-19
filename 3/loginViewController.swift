//
//  loginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class loginViewController: UIViewController {

    @IBOutlet var username_f: UITextField!
    @IBOutlet var password_f: UITextField!
    @IBAction func login(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(self.username_f.text!, password: self.password_f.text!, block: {(u, e)-> Void in
        
            if ((u) != nil) {
                
                print(u)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("start") as! UIViewController
                    self.presentViewController(viewController, animated: true, completion: nil)
                })
            } else {
                
                let alert = UIAlertView(title: "Error", message: "\(e)", delegate: self, cancelButtonTitle: "Ok")
            }
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = self.view.backgroundColor

        // Do any additional setup after loading the view.
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
