//
//  CustomCollectionViewCell.swift
//  WhatAnApp
//
//  Created by Cassie on 2024/10/16.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var cellModel: CellModel? {
        didSet {
            guard let cellModel = cellModel else { return }
            if let name = cellModel.imageName {
                nameLabel.text = name
                thumbnailImageView.image = UIImage(named: name)
            }
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

}
