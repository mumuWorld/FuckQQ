//
//  RegisterViewController.swift
//  fuckqq
//
//  Created by YangJie on 2017/7/12.
//  Copyright © 2017年 YangJie. All rights reserved.
//

import UIKit
import AVFoundation

class RegisterViewController: UIViewController {
    lazy var player:AVPlayer = {
        var player = AVPlayer()
        let playerItem:AVPlayerItem = self.playerItem
        player = AVPlayer.init(playerItem: playerItem)
        return player
    }()
    lazy var playerItem:AVPlayerItem = {
        let path = Bundle.main.path(forResource: "register_guide_video", ofType: ".mp4")
        let mp4Url:URL = URL.init(fileURLWithPath: path!)
        var playerItem = AVPlayerItem.init(url: mp4Url)
        return playerItem
    }()
    lazy var playerView:UIView = {
        let player:UIView = UIView.init(frame: self.view.frame)
        player.backgroundColor = UIColor.white
        return player
    }()
    lazy var playerLayer:AVPlayerLayer = {
        let pl:AVPlayerLayer = AVPlayerLayer.init(player: self.player)
        pl.frame = self.view.bounds
        pl.videoGravity = AVLayerVideoGravityResizeAspectFill //视频填充方式
        return pl
    }()
    lazy var loginBtn:UIButton = {
        let btn = UIButton.init(frame: CGRect.init(x: 100, y: 300, width: 200, height: 50))
        btn.backgroundColor = UIColor.cyan
        btn.addTarget(self, action: #selector(loginBtnClick(btn:)), for: UIControlEvents.touchUpInside)
        return btn
    }()
    var observe:NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加player view
        self.view.addSubview(self.playerView)
        //添加player layer
        self.playerView.layer.addSublayer(self.playerLayer)
        self.player.play()
        //添加登录按钮
        self.view.addSubview(loginBtn)
        //添加通知
//        let duration:CMTime = self.playerItem.duration 获取视频总长度
        observe = NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: OperationQueue.main, using: { (notification) in
            print("收到播放结束通知")
            //循环播放
            self.player.seek(to: CMTime.init(value: 0, timescale: 1))
            self.player.play()
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //析构函数
    deinit {
//        removeNotification()
    }
    func removeNotification()
    {
        print(self.observe ?? "ninininininl")
        NotificationCenter.default.removeObserver(self.observe!)
        self.observe = nil
    }
    func loginBtnClick(btn:UIButton)
    {
        removeNotification()
        let vc:ViewController = ViewController()
        let window:UIWindow = UIApplication.shared.keyWindow!
        window.rootViewController = vc

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
