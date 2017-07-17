//
//  RandomColor.swift
//  fuckqq
//
//  Created by YangJie on 2017/7/17.
//  Copyright © 2017年 YangJie. All rights reserved.
//
import UIKit
extension UIColor {
    open class var randomColor:UIColor{
        get{
            let r = arc4random_uniform(256);
            let g = arc4random_uniform(256);
            let b = arc4random_uniform(256);
            return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
        }
    }
}
