//
//  mainViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class mainViewController: UIViewController {

    @IBOutlet var MenuButton: UIBarButtonItem!
    
    @IBOutlet var username: UILabel!
    @IBOutlet var descr: UITextView!
    @IBAction func logout(sender: AnyObject) {
        
        PFUser.logOut()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("login_nav") as! UINavigationController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBOutlet var logout_button: UIButton!
    @IBOutlet var materials_button: UIButton!
    @IBOutlet var description_button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (PFUser.currentUser() == nil) {
                
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("login_nav") as! UINavigationController
            self.presentViewController(vc, animated: true, completion: nil)
        } else {
            
            self.username.text = PFUser.currentUser()?.username

            print(PFUser.currentUser()!.username)
            if (PFUser.currentUser() != nil) {
                let q = PFUser.query()
                q?.whereKey("username", equalTo: (PFUser.currentUser()?.username!)!)
                q?.getFirstObjectInBackgroundWithBlock{(o, e)-> Void in
                
                    if (e == nil) {
                        
                        self.descr.text = o!.objectForKey("description") as! String
                        self.descr.layer.borderWidth = 0.5
                        self.descr.layer.borderColor = UIColor.whiteColor().CGColor
                        self.descr.textColor = UIColor.whiteColor()
                        self.descr.textAlignment = .Center
                    }
                }
            }
        }
        
        self.materials_button.layer.borderColor = UIColor.whiteColor().CGColor
        self.materials_button.layer.borderWidth = 0.5
        self.logout_button.layer.borderColor = UIColor.whiteColor().CGColor
        self.logout_button.layer.borderWidth = 0.5
//        self.description_button.layer.borderColor = UIColor.whiteColor().CGColor
//        self.description_button.layer.borderWidth = 0.5
        
//        self.descr.layer.borderWidth = 0.5
//        self.descr.layer.borderColor = UIColor.whiteColor().CGColor
//        self.descr.textColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.barTintColor = self.view.backgroundColor
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.MenuButton.target = self.revealViewController()
        self.MenuButton.action = Selector("revealToggle:")

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
