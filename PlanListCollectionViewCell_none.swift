//
//  PlanListCollectionViewCell.swift
//  DateShare
//
//  Created by 木下真菜 on 2022/01/19.
//

import UIKit

class PlanListCollectionViewCell_none: UICollectionViewCell {
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var tag3: UILabel!
    @IBOutlet weak var tag2: UILabel!
    @IBOutlet weak var tag1: UILabel!
    @IBOutlet weak var discription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .blue
        // Initialization code
    }
    
//    func setUpContents(title: String, imageView: UIImage, discription: String, tag1: String, tag2: String, tag3: String, user: String) {
//
//    }
}
