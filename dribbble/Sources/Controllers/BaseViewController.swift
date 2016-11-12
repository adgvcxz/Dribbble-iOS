//
//  BaseViewController.swift
//  dribbble
//
//  Created by 赵巍 on 2016/11/10.
//  Copyright © 2016年 赵巍. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private var didSetupConstraints = false
    
    override func updateViewConstraints() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    func setupConstraints(){}
}
