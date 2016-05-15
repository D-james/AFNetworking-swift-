//
//  ViewController.swift
//  AFNetworking(swift封装)
//
//  Created by 段盛武 on 16/4/10.
//  Copyright © 2016年 D.James. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        最终的封装形态
        let urlString = "http://www.weather.com.cn/data/sk/101010100.html"
        
        DSWNetworkTool.shareNetworkTool.networkTool(.GET, urlString: urlString, parameters: nil) { (responseObject, error) -> () in
            if error != nil {
                print(error)
                return
            }
            print(responseObject)
        }
      
    }
//    封装为单例
    func demo1(){
        let urlString = "http://www.weather.com.cn/data/sk/101010100.html"
        
        DSWNetworkTool.shareNetworkTool.GET(urlString, parameters: nil, progress: nil, success: { (_, responseObject) -> Void in
            print(responseObject)
            }) { (_, error) -> Void in
                print(error)
        }
    }
//    没封装前
    func demo(){
        let manager = AFHTTPSessionManager()
        
        let urlString = "http://www.weather.com.cn/data/sk/101010100.html"
        
        manager.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        manager.GET(urlString, parameters: nil, progress: nil, success: { (task, responseObject) -> Void in
            print(responseObject)
            }) { (task, error) -> Void in
                print(error)
        }
    }

}

