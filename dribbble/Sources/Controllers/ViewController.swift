//
//  ViewController.swift
//  dribbble
//
//  Created by 赵巍 on 2016/11/7.
//  Copyright © 2016年 赵巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MoyaInstance.sharedInstance.getShots(page: 0, sort: "").mapToModelArr(Shot.self)
            .subscribe(onNext: { (shots) in
                print(shots[0].title)
            }, onError: {(error) in
                print(error)
            }, onCompleted: {
                print("onCompleted")
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

