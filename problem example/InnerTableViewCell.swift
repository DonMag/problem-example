//
//  InnerTableViewCell.swift
//  problem example
//
//  Created by ibrahim beltagy on 9/27/17.
//  Copyright © 2017 ibrahim beltagy. All rights reserved.
//

import UIKit



class InnerTableViewCell: UITableViewCell {
    @IBOutlet weak var commenterNameLabel: UILabel!
    @IBOutlet weak var commentBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
