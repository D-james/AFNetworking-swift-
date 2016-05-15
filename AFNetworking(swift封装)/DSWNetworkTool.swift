//
//  DSWNetworkTool.swift
//  AFNetworking(swift封装)
//
//  Created by 段盛武 on 16/4/11.
//  Copyright © 2016年 D.James. All rights reserved.
//

import UIKit
import AFNetworking

//swift 中的枚举
enum DSWHTTPMethod:String{
    case GET = "GET"
    case POST = "POST"
}

class DSWNetworkTool: AFHTTPSessionManager {
//声明一个单例类
    static let shareNetworkTool:DSWNetworkTool = {
        var tool = DSWNetworkTool()
//        在这添加你所需要的反序列化类型
        tool.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tool
    }()
    
//实现网络工具类
    func networkTool(method:DSWHTTPMethod,urlString:String,parameters:AnyObject?,finish:(responseObject:AnyObject?,error:NSError?) -> ()){
        let success = { (task:NSURLSessionDataTask, responseObject:AnyObject?) -> Void in
            finish(responseObject: responseObject, error: nil)
        }
        let failure = {(task: NSURLSessionDataTask?,error: NSError) -> Void in
            finish(responseObject: nil, error: error)
            }
        
        if method == .GET {
            GET(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        } else {
            POST(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
}
}
