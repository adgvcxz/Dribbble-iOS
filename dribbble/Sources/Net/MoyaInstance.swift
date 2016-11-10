//
// Created by 赵巍 on 2016/11/8.
// Copyright (c) 2016 赵巍. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Alamofire

class MoyaInstance {

    static let sharedInstance = MoyaInstance()
    let moyaProvider = RxMoyaProvider<ApiService>(endpointClosure: MoyaInstance.endpointClosure, manager: DefaultAlamofireManager.sharedManager, plugins: [NetLogger()])

    private init() {

    }

    func getShots(page: Int, sort: String) -> Observable<Response> {
        return moyaProvider.request(.getShots(page, sort))
    }
    
    
    public static func endpointClosure(target: ApiService) -> Endpoint<ApiService> {
        return MoyaProvider<ApiService>.defaultEndpointMapping(target).adding(parameters: ["access_token": ApiService.ClientAccessToken], httpHeaderFields: ["Connection": "close"])
    }
}

class DefaultAlamofireManager: Alamofire.SessionManager {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 3 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 3 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}


