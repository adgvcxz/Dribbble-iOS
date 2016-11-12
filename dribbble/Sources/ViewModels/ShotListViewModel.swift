//
//  ShotViewModel.swift
//  dribbble
//
//  Created by 赵巍 on 2016/11/12.
//  Copyright © 2016年 赵巍. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift
import RxCocoa

typealias ShotListSection = SectionModel<Void, Shot>

protocol ShotListViewModelType {
    
    var itemDidSelect: PublishSubject<IndexPath> { get }
    
    var sections: Driver<[ShotListSection]> { get }
}

struct ShotListViewModel: ShotListViewModelType {
    
    let itemDidSelect = PublishSubject<IndexPath>()
    
    let sections: Driver<[ShotListSection]>
    
    
    private let disposeBag = DisposeBag()
    
    init(disposeBag: DisposeBag) {
        self.sections = MoyaInstance.sharedInstance.getShots(page: 0, sort: "").mapToModelArr(Shot.self)
            .map{ (shots) -> [ShotListSection] in
                return [SectionModel(model: Void(), items: shots)]
            }.asDriver(onErrorJustReturn: [])
        
        self.itemDidSelect.map { (indexPath) -> Int in
            return indexPath.row
        }.asDriver(onErrorDriveWith: .empty()).drive(onNext: { (index) in
            print(index)
        }).addDisposableTo(disposeBag)
    }
    
}
