//
//  resultViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    @IBOutlet var res: UILabel!
    @IBOutlet var congt: UILabel!
    @IBOutlet var max_sc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.res.text = "Your Scores: \(result.result)"
        self.max_sc.text = "Max: \(result.max)"
        
        if (result.result < result.max/2) {
            
            self.congt.text = "Try Again"
        } else {
            
            self.congt.text = "Good!"
        }

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
