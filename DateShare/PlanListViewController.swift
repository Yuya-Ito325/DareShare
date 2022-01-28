//
//  PlanListViewController.swift
//  DateShare
//
//  Created by 木下真菜 on 2021/12/29.
//

import UIKit

class PlanListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var planList: [PlanListModel] = []
    let planListData = [
        [1, "ポケセンデート", "プラン写真", "ああああああああああああああああああああああああああああああああああああああああああああああああ", "海", "夏", "川", "user1"],
        [2, "那谷寺でデート", "kennrokuenn", "那谷寺デートです", "八海山", "山", "兼六園", "user2"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "PlanListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        print("PlanList画面")
        SetCellSize()
        
    }
    
    func SetCellSize() {
        let layout = UICollectionViewFlowLayout()
        let margin: CGFloat = 5.0
        layout.itemSize = CGSize(width: self.view.frame.width - 25, height: self.view.frame.height / 5)
        layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        collectionView.collectionViewLayout = layout
    }
}

extension PlanListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planListData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! PlanListCollectionViewCell
        
        cell.title.text = planListData[indexPath.row][1] as? String
        cell.imageView.image = UIImage(named: planListData[indexPath.row][2] as! String)
        cell.discription.text = planListData[indexPath.row][3] as? String
        cell.tag1.setTitle(planListData[indexPath.row][4] as? String, for: .normal)
        cell.tag2.setTitle(planListData[indexPath.row][5] as? String, for: .normal)
        cell.tag3.setTitle(planListData[indexPath.row][6] as? String, for: .normal)
        cell.userName.text = planListData[indexPath.row][7] as? String
        
        return cell
    }
}
