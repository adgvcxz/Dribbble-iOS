//
// Created by 赵巍 on 2016/11/8.
// Copyright (c) 2016 赵巍. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum ApiService {

    static let PageNumber = 20

    //MARK: Dribbble Token
    static let ClientId = "ff29cefaeb3df7e915e21af05c393af4294742c563dd9c705d0f70636560c93d"
    static let ClientSecret = "15b88962e2e90aec8593641272583f990c6fe4e3e284cbd936d60c332b6070dc"
    static let ClientAccessToken = "96b9b0242263b69c9f9227262252b48649e1b7c16edd2bb93fc79fb2c685b362"

    case getShots(Int, String)
}

extension ApiService: TargetType {
    public var method: Moya.Method {
        return .get
    }

    public var baseURL: URL {
        return URL(string: "https://api.dribbble.com/v1/")!
    }


    public var path: String {
        return "shots"
    }

    public var parameters: [String: Any]? {
        switch self {
        case let .getShots(page, sort):
            return ["page": page, "sort": sort]
        default:
            return nil
        }
    }

    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }

    public var task: Task {
        return .request
    }


}
