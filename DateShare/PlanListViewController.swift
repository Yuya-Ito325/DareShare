//
//  PlanListViewController.swift
//  DateShare
//
//  Created by 木下真菜 on 2021/12/29.
//

import UIKit

//class PlanListViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
//
////    var planList = [
////        [1, "ポケセンデート", "kennrokuenn", 2, "海", "夏", "川"],
////        [2, "那谷寺でデート", "kennrokuenn", 1, "海", "夏", "冬"],
////    ]
//    var planList: [PlanListModel] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.tableFooterView = UIView()
//        setPlanData()
//        // Do any additional setup after loading the view.
//    }
//
//    func setPlanData() {
//        for i in 1...planList.count {
//            let planListModel = PlanListModel(id: i, title: "タイトル\(i)", image: "kennrokuenn", user_id: i, tag1: "夏", tag2: "川", tag3: "海")
//            planList.append(planListModel)
//        }
//    }
//}
//
//extension PlanListViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return planList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlanListTableViewCell", for: indexPath)
//        let planListModel: PlanListModel = planList[indexPath.row]
//        cell.textLabel?.text = planListModel.title
//        return cell
//    }
//}
//
//extension PlanListViewController: UITableViewDelegate {
//}

class PlanListViewController: UIViewController {
    var planList: [PlanListModel] = []
    let planListData = [
        [1, "ポケセンデート", "kennrokuenn", "ポケセンデートです", 2, "海", "夏", "川"],
        [2, "那谷寺でデート", "kennrokuenn", "那谷寺デートです", 1, "海", "山", "冬"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print(planListData[0][0])
//        setPlanData()
        // Do any additional setup after loading the view.
    }
    
//    func setPlanData() {
//        for i in 0...planListData.count {
//            let planListModel = PlanListModel(
//                id: planListData[i][0] as! Int,
//                title: planListData[i][1] as! String,
//                image: planListData[i][2] as! String,
//                discription: planListData[i][3] as! String,
//                user_id: planListData[i][4] as! Int,
//                tag1: planListData[i][5] as! String,
//                tag2: planListData[i][6] as! String,
//                tag3: planListData[i][7] as! String
//            )
//            planList.append(planListModel)
//        }
//        print(planListData)
//    }
}

extension PlanListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //storyboard上のセルを生成　storyboardのIdentifierで付けたものをここで設定する
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        //セル上のTag(1)とつけたUILabelを生成
        let title = cell.contentView.viewWithTag(1) as! UILabel
        title.text = String("タイトル")

        let imageView = cell.contentView.viewWithTag(2) as! UIImageView
        imageView.image = UIImage(named: "kennrokuenn")
        
        let discription = cell.contentView.viewWithTag(3) as! UILabel
        discription.text = String("説明説明")
        
        let user_id = cell.contentView.viewWithTag(4) as! UILabel
        user_id.text = String("User: 1")
        
        let tag1 = cell.contentView.viewWithTag(5) as! UILabel
        tag1.text = String("夏")
        
        let tag2 = cell.contentView.viewWithTag(6) as! UILabel
        tag2.text = String("海")
        
        let tag3 = cell.contentView.viewWithTag(7) as! UILabel
        tag3.text = String("川")
        return cell
    }
}

extension PlanListViewController: UICollectionViewDelegate {
}

extension PlanListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // 横方向のスペース調整
        let horizontalSpace:CGFloat = 20

        //セルのサイズを指定。画面上にセルを3つ表示させたいのであれば、デバイスの横幅を3分割した横幅　- セル間のスペース*2（セル間のスペースが二つあるため）
        let cellSize:CGFloat = self.view.bounds.width - horizontalSpace*2

        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: self.view.bounds.height/6)
    }
}
