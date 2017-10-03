//
//  LoveList.swift
//  LoveList
//
//  Created by Stephen Martinez on 10/2/17.
//  Copyright © 2017 Stephen Martinez. All rights reserved.
//

import Foundation

class LoveList{
    
    private init(){}
    static let shared = LoveList()
    
    var sampleInfo = [
        (name: "Bob Hasler", nickName:"The Legend"),
        (name:"Jim Sharpley", nickName:"The Hair with some to share"),
        (name:"Axel Remund", nickName:"Looks good in overalls!"),
        (name:"Christian Magana", nickName:"El Suavecito")
    ]
    
}

struct LoveListConstant {
    static let loveCellRID = "loveCell"
}
