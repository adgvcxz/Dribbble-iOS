//
// Created by 赵巍 on 2016/11/9.
// Copyright (c) 2016 赵巍. All rights reserved.
//

import Foundation
import ObjectMapper

class Shot: Mappable {

    var id: Int64!
    var title: String!
    var description: String!
    var image: Image!
    var viewsCount: Int!
    var likesCount: Int!
    var commentsCount: Int!
    var bucketsCount: Int!
    var createdAt: Date!
    var updatedAt: Date!
    var tags: [String]!


    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.description <- map["description"]
        self.image <- map["images"]
        self.viewsCount <- map["viewsCount"]
        self.likesCount <- map["likesCount"]
        self.commentsCount <- map["commentsCount"]
        self.bucketsCount <- map["bucketsCount"]
        self.createdAt <- (map["createdAt"], DateTransform())
        self.updatedAt <- (map["updatedAt"], DateTransform())
        self.tags <- map["tags"]
    }

}
