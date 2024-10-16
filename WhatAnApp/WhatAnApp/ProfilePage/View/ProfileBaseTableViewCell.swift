//
//  CCProfileBaseTableViewCell.swift
//  WhatAnApp
//
//  Created by Cassie on 2024/10/15.
//

import UIKit

class ProfileBaseTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //selectionStyle = .none
        accessoryType = .none
    }

    var identifier: String! {
        didSet {
            titleLabel.text = identifier.localized
        }
    }
    
}
