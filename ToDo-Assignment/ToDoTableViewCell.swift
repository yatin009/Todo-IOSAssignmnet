//
//  ToDoTableViewCell.swift
//  ToDo-Assignment
//
//  Created by Yatin on 31/01/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoName: UILabel!
    @IBOutlet weak var todoSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchListner(_ sender: UISwitch) {
        if(sender.isOn) {
            todoName.textColor = UIColor.black
            todoName.font = UIFont.boldSystemFont(ofSize: 20)
        }
        else {
            todoName.textColor = UIColor.lightGray
            todoName.font = UIFont.italicSystemFont(ofSize: 20)
        }
    }
}
