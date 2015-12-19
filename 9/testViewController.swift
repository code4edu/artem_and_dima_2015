//
//  testViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class testViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var nameOFMaterial: UILabel!
    @IBOutlet var answwers: UITableView!
    @IBOutlet var question: UITextView!
    
    var chosen_index: NSIndexPath?
    var index = 0
    
    var test: NSMutableArray = NSMutableArray()
    func load() {
        
        self.nameOFMaterial.text = chosen_material.material![0] as! String
        
        test = chosen_material.material![2] as! NSMutableArray
        print(test.count)
        self.question.text = self.test[index][0] as! String
    }
    
   
    @IBAction func prev(sender: AnyObject) {
        
        if (index > 0) {
            
            index--
            self.question.text = self.test[index][0] as! String
            self.answwers.userInteractionEnabled = true
            self.answwers.reloadData()
        }
    }
    @IBAction func confirm(sender: AnyObject) {
        
        if (chosen_index != nil) {
            
            if (chosen_index!.section == test[index][2] as! Int) {
                
                let cell = self.answwers.cellForRowAtIndexPath(chosen_index!)
                cell?.backgroundColor = UIColor.greenColor()
                if (self.answwers.userInteractionEnabled == true) {
                result.result += 1
                }
                
                self.answwers.userInteractionEnabled = false
            } else {
                
                let cell = self.answwers.cellForRowAtIndexPath(chosen_index!)
                cell?.backgroundColor = UIColor.redColor()
                self.answwers.userInteractionEnabled = false
            }
        }
    }
    @IBAction func next(sender: AnyObject) {
        
        if (index < test.count-1) {
            
            index++
            self.question.text = self.test[index][0] as! String
            self.answwers.userInteractionEnabled = true
            self.answwers.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()
        
        result.result = 0
        result.max = self.test.count
        
        self.answwers.delegate = self
        self.answwers.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.test[index][1].count
//        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = test[index][1][indexPath.section] as! String
        
        cell.backgroundColor = UIColor.clearColor()
        cell.userInteractionEnabled = true
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = self.answwers.cellForRowAtIndexPath(indexPath)
        if (chosen_index != nil && chosen_index == indexPath) {
            
            cell?.backgroundColor = UIColor.clearColor()
            chosen_index = nil
        } else {
            if (chosen_index != nil && chosen_index != indexPath) {

                
                let new_cell = self.answwers.cellForRowAtIndexPath(chosen_index!)?.backgroundColor = UIColor.clearColor()
                chosen_index = indexPath
                cell?.backgroundColor = UIColor.grayColor()
                
            } else {
                
                if (chosen_index == nil) {
                    chosen_index = indexPath
                    cell?.backgroundColor = UIColor.grayColor()
                }
            }
        }

    }
    
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 15.0
    }
    
    func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clearColor()
    }

}
