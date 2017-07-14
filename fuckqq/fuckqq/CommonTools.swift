//
//  CommonTools.swift
//  fuckqq
//
//  Created by YangJie on 2017/7/12.
//  Copyright © 2017年 YangJie. All rights reserved.
//

import UIKit
import Security

class CommonTools: NSObject {
    
}

class MMKeyChain: NSObject {
    let useraccount_key = "useraccount"
    let userPSWD_key = "userpswd"
    let userDefault = UserDefaults.standard
    let udid = UIDevice.current.identifierForVendor?.uuidString
    static let shareInstance:MMKeyChain = MMKeyChain()
    private override init() {
        
    }
    public func saveUserData(withDcit dict:Dictionary<String, String>)->Void {
        //获取账号密码
        let result = getAcountPSWD(dict: dict)
        
        userDefault.setValue(result.account, forKey: useraccount_key);
        userDefault.synchronize()
        let isHaveData = getUserData()
        if isHaveData.ishave {
            self.deleteUserData()
        }
        HYKeychainHelper.set(password: result.password, service: udid, account: useraccount_key)

    }
    public func getUserData()-> (ishave:Bool,account:String?){
        let userAccount = userDefault.value(forKey: useraccount_key);
        
        if String(describing: userAccount).isEmpty  {
            return (false,userAccount as? String)
        } else {
            let udid = UIDevice.current.identifierForVendor?.uuidString
            let password = HYKeychainHelper.password(service: udid, account: useraccount_key)
            if password==nil {
                return (false,nil)
            } else {
                return (true,userAccount as? String)
            }
        }
    }
    public func deleteUserData()->Void {
        HYKeychainHelper.deletePassword(service: udid, account: useraccount_key)
    }
    private func getAcountPSWD(dict:Dictionary<String, String>)->(account:String ,password:String) {
        let ac = dict[useraccount_key]
        let pswd = dict[userPSWD_key]
        
        return (ac!,pswd!)
    }
}
