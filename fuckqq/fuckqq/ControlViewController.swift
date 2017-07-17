//
//  ControlViewController.swift
//  fuckqq
//
//  Created by YangJie on 2017/7/17.
//  Copyright © 2017年 YangJie. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    private lazy var leftVC:LeftViewController? = {
        let leftVC:LeftViewController = LeftViewController()
        leftVC.view.backgroundColor = UIColor.randomColor
        leftVC.view.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        return leftVC
    }()
    private lazy var mainVC:MainTabViewController? = {
        let rightVC:MainTabViewController = MainTabViewController()
        return rightVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor
        self.addChildViewController(self.leftVC!)
        self.view.addSubview((self.leftVC?.view)!)
//
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
