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
    var shots: Variable<[Shot]>
    
    
    init(disposeBag: DisposeBag) {
        let shots = Variable<[Shot]>([])
        self.shots = shots
        self.sections = self.shots.asObservable()
            .map{ (shots) -> [ShotListSection] in
                return [SectionModel(model: Void(), items: shots)]
            }.asDriver(onErrorJustReturn: [])
        
        self.itemDidSelect.map { (indexPath) -> Int in
            return indexPath.row
        }.asDriver(onErrorDriveWith: .empty()).drive(onNext: { (index) in
            print(shots.value[index].image.hidpi)
        }).addDisposableTo(disposeBag)
        
        MoyaInstance.sharedInstance.getShots(page: 0, sort: "").mapToModelArr(Shot.self)
        .subscribe(onNext: { (items) in
            shots.value += items
        }).addDisposableTo(disposeBag)
    }
}
