//
//  userTableViewCell.swift
//  ParseStarterProject-Swift
//
//  Created by Artyom on 19.12.15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class userTableViewCell: UITableViewCell {

    @IBOutlet var descr_label: UILabel!
    @IBOutlet var username: UILabel!
    @IBOutlet var descr: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
