//
//  PlanModel.swift
//  DateShare
//
//  Created by 木下真菜 on 2022/01/15.
//

import Foundation
import UIKit

struct PlanModel {
    var id: Int
    var title: String
    var image: UIImage
    var description: String
    var date: Date
    var user_id: Int
    // 集合
    var meetingTime: Date
    var meetingPlace: String
    // プラン1
    var plan1StartTime: Date
    var plan1EndTime: Date
    var plan1Place: String
    var plan1Image: UIImage
    // 移動1
    var move1StartTime: Date
    var move1EndTIme: Date
    var move1Transportation: String
    // プラン2
    var plan2StartTime: Date
    var plan2EndTime: Date
    var plan2Place: String
    var plan2Image: UIImage
    // 移動2
    var move2StartTime: Date
    var move2EndTIme: Date
    var move2Transportation: String
    // プラン3
    var plan3StartTime: Date
    var plan3EndTime: Date
    var plan3Place: String
    var plan3Image: UIImage
    // 移動3
    var move3StartTime: Date
    var move3EndTIme: Date
    var move3Transportation: String
    // プラン4
    var plan4StartTime: Date
    var plan4EndTime: Date
    var plan4Place: String
    var plan4Image: UIImage
    // 移動4
    var move4StartTime: Date
    var move4EndTIme: Date
    var move4Transportation: String
    // タグ
    var tag1: String
    var tag2: String
    var tag3: String
}
