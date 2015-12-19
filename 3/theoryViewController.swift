//
//  theoryViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class theoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table_view: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.table_view.delegate = self
        self.table_view.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return chosen_material.material![1].count
    }
    
    var ident = ""
    var textHeight: CGFloat = 0.0
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (chosen_material.material![1][indexPath.row][0] as! String == "text") {
            
            ident = "text"
        } else {
            
            ident = "photo"
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(ident, forIndexPath: indexPath) as! textTableViewCell
        
        // Configure the cell...
        
        if (ident == "text") {
            
            cell.txt.text = chosen_material.material![1][indexPath.row][1] as! String
            print(chosen_material.material![1][indexPath.row][1])
            let fixedWidth = cell.txt.frame.size.width
            cell.txt.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
            let newSize = cell.txt.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
            var newFrame = cell.txt.frame
            newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            cell.txt.frame = newFrame;
            textHeight = newFrame.height
        } else {
            
            let file = chosen_material.material![1][indexPath.row][1] as! PFFile
            file.getDataInBackgroundWithBlock({
                (imageData, error) -> Void in
                if (error == nil) {
                    let image = UIImage(data:imageData!)
                    cell.photo.image = image
                }
            })
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if (ident == "text") {
            
            return textHeight
        }
        
        return 197.0
    }
}
