//
//  userTableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class userTableViewController: UITableViewController, UISearchBarDelegate {

    var names_array: NSMutableArray = NSMutableArray()
    var array: NSMutableArray = NSMutableArray()
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var MenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = self.view.backgroundColor
        
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: "dismisKeyboard")
        self.view.addGestureRecognizer(tap)
        
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        self.MenuButton.target = self.revealViewController()
//        self.MenuButton.action = Selector("revealToggle:")
        
    }
    
    func dismisKeyboard() {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        
//        searchBar.text = ""
//        dismisKeyboard()
//    }
//    
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        
////        search()
//    }
    
//    func search() {
//        
//        self.names_array = NSMutableArray()
//        self.array = NSMutableArray()
//        
//        let q = PFUser.query()
//        q?.findObjectsInBackgroundWithBlock{(o, e)-> Void in
//            
//            if (e == nil) {
//                
//                for i in 0..<o!.count {
//                    
//                    //                    let name = o![i].objectForKey("username") as! String
//                    //                    print(name)
//                    //                    print("")
//                    //                    if (name.lowercaseString.containsString(self.searchBar.text!)) {
//                    //
//                    //                        self.array.addObject(o![i])
//                    //                        self.names_array.addObject(name)
//                    //                    }
//                    if (o![i].objectForKey("username") != nil) {
//                        let cur_arr = o![i].objectForKey("username") as! String
//                        var string = cur_arr.lowercaseString
//                        print(string)
//                        print(self.searchBar.text)
//                        if (string.containsString((self.searchBar.text?.lowercaseString)!)) {
//                            print("yes")
//                            
//                            self.array.addObject(o![i])
//                            self.names_array.addObject(string)
//                            self.tableView.reloadData()
//                            print("reload")
//                            
//                            //                            print(self.array.count)
//                            //                            self.table_view.reloadData()
//                        } else {
//                            
//                            //                            self.array = NSMutableArray()
//                        }
//                    }
//                    
//                }
//            }
//        }
//    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return self.names_array.count
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        
//        cell.textLabel?.text = self.names_array[indexPath.section] as! String
//        cell.textLabel?.textColor = UIColor.whiteColor()
        
        return cell
    }
    
//    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        
//        return 15.0
//    }
    
//    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
//        
//        view.tintColor = UIColor.clearColor()
//    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = self.tableView.cellForRowAtIndexPath(indexPath)
        
        print("cc")
        
//        chosen_user.user = self.array[indexPath.section] as! NSMutableArray
//        print(chosen_user.user)
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("index")
    }

}
