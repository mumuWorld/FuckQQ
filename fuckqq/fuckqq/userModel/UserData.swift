//
//  UserData.swift
//  fuckqq
//
//  Created by YangJie on 2017/7/12.
//  Copyright © 2017年 YangJie. All rights reserved.
//

import UIKit

class UserData: NSObject {
    var userName:String?
    var userPassword:String?
    var userHeadImg:String?
    var userSex:String?
    var userAccount:String?
    
    init(userName:String ,userPassword:String) {
        self.userName=userName
        self.userPassword=userPassword
    }
}
