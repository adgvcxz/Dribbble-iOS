//
//  ShotViewCell.swift
//  dribbble
//
//  Created by 赵巍 on 2016/11/10.
//  Copyright © 2016年 赵巍. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ShotViewCell: BaseTableViewCell {
    
    var shotImageView = UIImageView()
    
    override func initialize() {
        self.contentView.addSubview(shotImageView)
        shotImageView.contentMode = .scaleAspectFill
        shotImageView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shotImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    func update(shot: Shot) {
        shotImageView.kf.setImage(with: URL(string: shot.image.hidpi))
    }
}
