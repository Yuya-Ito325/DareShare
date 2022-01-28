//
//  PlanListCollectionViewCell.swift
//  DateShare
//
//  Created by 木下真菜 on 2022/01/25.
//

import UIKit

class PlanListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tag3: UIButton!
    @IBOutlet weak var tag2: UIButton!
    @IBOutlet weak var tag1: UIButton!
    @IBOutlet weak var discription: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1.0
        // Initialization code
    }
}
