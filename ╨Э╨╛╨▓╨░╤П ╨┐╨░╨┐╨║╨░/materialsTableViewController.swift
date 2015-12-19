
//
//  materialsTableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class materialsTableViewController: UITableViewController {
    
    var array: NSMutableArray = NSMutableArray()
    
    func load() {
        
        let q = PFUser.query()
        q?.whereKey("username", equalTo: (PFUser.currentUser()?.username!)!)
        q?.findObjectsInBackgroundWithBlock{(o, e)-> Void in
            
            if (e == nil) {

                for i in 0..<o!.count {
                    
                    if (o![i].objectForKey("materials") != nil) {
                        
                        let cur_mat = o![i].objectForKey("materials") as! NSMutableArray
                        self.array.addObject(cur_mat)
                        self.tableView.reloadData()
                    }
                }
            } else {
                
                print(e)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        load()
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        if (self.array.count != 0) {
            
            return self.array.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        
        if (self.array.count != 0) {
            
            cell.textLabel?.text = self.array[indexPath.section][0] as! String
            cell.textLabel?.textColor = UIColor.whiteColor()
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 30.0
    }
    
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor.clearColor()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = self.tableView.cellForRowAtIndexPath(indexPath)
        
        chosen_material.material = self.array[indexPath.section] as! NSMutableArray
        print(chosen_material.material![1].count)
    }

}
