//
//  ViewController.swift
//  fuckqq
//
//  Created by YangJie on 2017/7/12.
//  Copyright © 2017年 YangJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var account_label:UITextField!
    var pswd_label:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let tmp = MMKeyChain.shareInstance.getUserData();
        print("tmp=",tmp)
        
        account_label = UITextField()
        account_label.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        self.view.addSubview(account_label)
        account_label.backgroundColor = UIColor.blue
        
        pswd_label = UITextField(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        pswd_label.backgroundColor = UIColor.lightGray
        self.view.addSubview(pswd_label)
        
        let login:UIButton = UIButton()
        login.frame = CGRect(x: 100, y: 400, width: 50, height: 50)
        self.view.addSubview(login)
        login.backgroundColor = UIColor.cyan
        login.addTarget(self, action: #selector(loginBtnClick(_:)), for: UIControlEvents.touchUpInside)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func loginBtnClick(_ btn:UIButton){
        view.endEditing(true)
        print("account_label",account_label.text!,"pswd_label",pswd_label.text!)
        let dict:Dictionary<String,String> = ["useraccount":account_label.text!,"userpswd":pswd_label.text!]
        
        MMKeyChain.shareInstance.saveUserData(withDcit: dict)
    }
}

