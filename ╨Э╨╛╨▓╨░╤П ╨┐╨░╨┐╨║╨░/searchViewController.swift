//
//  searchViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class searchViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var array: NSMutableArray = NSMutableArray()


    @IBAction func search_all_(sender: AnyObject) {
        
        search_all()
    }
    @IBOutlet var table_view: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = self.view.backgroundColor
        
        self.searchBar.delegate = self

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: "dismisKeyboard")
        self.view.addGestureRecognizer(tap)
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
    }
    
    func search_all() {
        
        self.array = NSMutableArray()
        let q = PFUser.query()
        q?.findObjectsInBackgroundWithBlock{(o, e)-> Void in
        
            if (e == nil) {
                
                for i in 0..<o!.count {
                    
                    if (o![i].objectForKey("materials") != nil) {
                        
                        self.array.addObject(o![i].objectForKey("materials")!)
                    }
                }
            }
        }
        
        print(self.array)
    }
    
    func search() {
        
        self.array = NSMutableArray()
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
            
//            cell.textLabel?.text = self.array[indexPath.section]
        }
        
        return cell
    }

}
