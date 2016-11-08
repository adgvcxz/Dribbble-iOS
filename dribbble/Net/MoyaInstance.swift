//
// Created by 赵巍 on 2016/11/8.
// Copyright (c) 2016 赵巍. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class MoyaInstance {

    static let shareInstance = MoyaInstance()
    let moyaProvider = RxMoyaProvider<ApiService>()

    private init() {

    }

    func getShots(page: Int, sort: String) {
        
    }



}
