//
//  CCProfileMainTableViewCell.swift
//  WhatAnApp
//
//  Created by Cassie on 2024/10/15.
//

import UIKit

class ProfileMainTableViewCell: UITableViewCell {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    var person: Person! {
        didSet {
            nameLabel.text = person.name
            emailLabel.text = person.email
            if let imageName = person.headImageName {
                headImageView.image = UIImage(named: imageName)
            }
        }
    }

}
