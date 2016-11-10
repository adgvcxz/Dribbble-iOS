//
//  NetLogger.swift
//  dribbble
//
//  Created by 赵巍 on 2016/11/9.
//  Copyright © 2016年 赵巍. All rights reserved.
//

import Foundation
import Moya
import Result

class NetLogger: PluginType {
    func willSendRequest(_ request: RequestType, target: TargetType) {
//        print("url: \(request.request!.url!.absoluteString) \n")
    }
    
    func didReceiveResponse(_ result: Result<Moya.Response, Moya.Error>, target: TargetType) {
//        print("=============")
//        switch result {
//        case .failure(let error):
//            print(error)
//        case .success(let respnse):
//            var str = String(data: respnse.data, encoding: .utf8)!
//            str = str.replacingOccurrences(of: "", with: "\n")
//            print("response:\n \(str)")
//        }
//        print(MoyaInstance.sharedInstance.moyaProvider)
    }
}
