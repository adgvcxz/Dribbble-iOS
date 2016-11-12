//
//  NSObject+Dribbble.swift
//  dribbble
//
//  Created by 赵巍 on 2016/11/12.
//  Copyright © 2016年 赵巍. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
    }
    
    //用于获取 cell 的 reuse identifier
    class var identifier: String {
        return String(format: "%@_identifier", self.nameOfClass)
    }
    
}
