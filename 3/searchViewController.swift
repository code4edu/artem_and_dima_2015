//
//  searchViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class searchViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var MenuButton: UIBarButtonItem!
    var array: NSMutableArray = NSMutableArray()


    @IBAction func search_all_(sender: AnyObject) {
        
        search_all()
    }
    @IBOutlet var table_view: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = self.table_view.backgroundColor
        
        self.table_view.separatorColor = UIColor.clearColor()
        
        self.searchBar.delegate = self
        self.table_view.delegate = self
        self.table_view.dataSource = self

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: "dismisKeyboard")
        self.view.addGestureRecognizer(tap)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.MenuButton.target = self.revealViewController()
        self.MenuButton.action = Selector("revealToggle:")
    }
    
    func dismisKeyboard() {
        
        view.endEditing(true)
        searchBar.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        dismisKeyboard()
        searchBar.text = ""
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        search()
//        dismisKeyboard()
    }
    
    func search_all() {
        
        self.array = NSMutableArray()
        let q = PFUser.query()
        q?.findObjectsInBackgroundWithBlock{(o, e)-> Void in
        
            if (e == nil) {
                
                for i in 0..<o!.count {
                    
                    if (o![i].objectForKey("materials") != nil) {
                        
                        self.array.addObject(o![i].objectForKey("materials")!)
//                        print(self.array.count)
                        self.table_view.reloadData()
                    }
                }
            } else {
                
                print(e)
            }
        }
    }
    
    func search() {
        
        self.array = NSMutableArray()
        
        let q = PFUser.query()
        q?.findObjectsInBackgroundWithBlock{(o, e)-> Void in
            
            if (e == nil) {
                
                for i in 0..<o!.count {
                    
                    if (o![i].objectForKey("materials") != nil) {
                        let cur_arr = o![i].objectForKey("materials") as! NSMutableArray
                        var string = cur_arr[0] as! String
                        string = string.lowercaseString
                        print(string)
                        print(self.searchBar.text)
                        if (string.containsString((self.searchBar.text?.lowercaseString)!)) {
                            print("yes")
                            
                            self.array.addObject(o![i].objectForKey("materials")!)
//                            print(self.array.count)
                            self.table_view.reloadData()
                        } else {
                            
//                            self.array = NSMutableArray()
                        }
                    }
                }
            } else {
                
                print(e)
            }
        }

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.array.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        if (self.array.count != 0) {
            
            cell.textLabel?.text = self.array[indexPath.section][0] as! String
            cell.textLabel?.textColor = UIColor.whiteColor()
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 30.0
    }
    
    func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("ttttt")
        
        let cell = self.table_view.cellForRowAtIndexPath(indexPath)
        chosen_material.material = self.array[indexPath.section] as! NSMutableArray
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("theory") as! UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }

}
