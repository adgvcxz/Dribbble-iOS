//
//  Observable+Mapper.swift
//  dribbble
//
//  Created by 赵巍 on 2016/11/9.
//  Copyright © 2016年 赵巍. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper
import Moya


enum DError: Swift.Error {
    case ORMNoRepresentor
}

extension Observable {
    
    func mapToModel<T: Mappable>(_: T.Type) -> Observable<T> {
        return of(type: Response.self).map({ (response) -> String in
            guard let json = String(data: response.data, encoding: .utf8) else {
                throw DError.ORMNoRepresentor
            }
            return json
        }).map({ json -> T in
            guard let model = Mapper<T>().map(JSONString: json) else {
                throw DError.ORMNoRepresentor
            }
            return model
        })
    }
    
    func mapToModelArr<T: Mappable>(_: T.Type) -> Observable<[T]> {
        return of(type: Response.self).map({ (response) -> String in
            guard let json = String(data: response.data, encoding: .utf8) else {
                throw DError.ORMNoRepresentor
            }
            return json
        }).map({ json -> [T] in
            guard let model = Mapper<T>().mapArray(JSONString: json) else {
                throw DError.ORMNoRepresentor
            }
            return model
        })
    }
    
    func of<T>(type: T.Type) -> Observable<T> {
        return filter({ (e) -> Bool in
            print(e)
            return e is T
        }).map({ (e) -> T in
            return e as! T
        })
    }
    
}
