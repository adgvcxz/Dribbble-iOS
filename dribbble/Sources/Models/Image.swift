//
//  Image.swift
//  dribbble
//
//  Created by 赵巍 on 2016/11/13.
//  Copyright © 2016年 赵巍. All rights reserved.
//

import Foundation
import ObjectMapper

class Image: Mappable {
    
    
    var hidpi: String {
        if _hidpi != nil {
            return _hidpi!
        }
        if normal != nil {
            return normal!
        }
        return teaser
    }
    
    
    var _hidpi: String?
    var normal: String?
    var teaser: String!
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self._hidpi <- map["hidpi"]
        self.normal <- map["normal"]
        self.teaser <- map["teaser"]
    }
}
