//
//  usersViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class usersViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var sB: UITextField!
    var array: NSMutableArray = NSMutableArray()
    var names_array: NSMutableArray = NSMutableArray()
    var descr_arr: NSMutableArray = NSMutableArray()
    
    @IBAction func sbClicked(sender: AnyObject) {
    
        if (sB.text != nil) {
            
            search()
        }
    }

    @IBOutlet var table_view: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var MenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table_view.delegate = self
        self.table_view.dataSource = self
        
        self.table_view.userInteractionEnabled = true
        
        self.searchBar.delegate = self
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = self.view.backgroundColor

        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: "dismisKeyboard")
        self.view.addGestureRecognizer(tap)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.MenuButton.target = self.revealViewController()
        self.MenuButton.action = Selector("revealToggle:")
        
    }
    
    func dismisKeyboard() {
        
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        searchBar.text = ""
        dismisKeyboard()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        search()
    }
    
    func search() {
        
        self.names_array = NSMutableArray()
        self.array = NSMutableArray()
        
        let q = PFUser.query()
        q?.findObjectsInBackgroundWithBlock{(o, e)-> Void in
         
            if (e == nil) {
                
                for i in 0..<o!.count {
                    
//                    let name = o![i].objectForKey("username") as! String
//                    print(name)
//                    print("")
//                    if (name.lowercaseString.containsString(self.searchBar.text!)) {
//                        
//                        self.array.addObject(o![i])
//                        self.names_array.addObject(name)
//                    }
                    if (o![i].objectForKey("username") != nil) {
                        let cur_arr = o![i].objectForKey("username") as! String
                        var string = cur_arr.lowercaseString
                        print(string)
//                        print(self.searchBar.text)
                        if (string.containsString((self.searchBar.text?.lowercaseString)!)) {
                            print("yes")
                            
                            let str = o![i].objectForKey("description")
                            
                            //
                                self.descr_arr.addObject(str!)
                            //
                            
                            self.array.addObject(o![i])
                            self.names_array.addObject(string)
                            self.table_view.reloadData()
                            print("reload")
                            
                            //                            print(self.array.count)
//                            self.table_view.reloadData()
                        } else {
                            
                            //                            self.array = NSMutableArray()
                        }
                    }

                }
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.names_array.count
//        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! userTableViewCell
        
        // Configure the cell...
        
//        cell.textLabel?.text = self.names_array[indexPath.section] as! String
        cell.username.text = self.names_array[indexPath.section] as! String
        cell.username.textColor = UIColor.whiteColor()
        cell.descr.text = self.descr_arr[indexPath.section] as! String
        cell.descr.textColor = UIColor.whiteColor()
        cell.descr.layer.borderWidth = 0.5
        cell.descr.layer.borderColor = UIColor.whiteColor().CGColor
        cell.descr.textAlignment = .Center
        cell.userInteractionEnabled = true
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 15.0
    }
    
    func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 132.0
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        let cell = self.table_view.cellForRowAtIndexPath(indexPath)
//        
//        chosen_user.user = self.array[indexPath.section] as! NSMutableArray
//        print(chosen_user.user)
//    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        let cell = self.table_view.cellForRowAtIndexPath(indexPath)
//        
//        print("qwe")
    
//        chosen_user.user = self.array[indexPath.section] as! NSMutableArray
//        print(chosen_user.user)
    
}
