//
//  ViewController.swift
//  dribbble
//
//  Created by 赵巍 on 2016/11/7.
//  Copyright © 2016年 赵巍. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift
import RxDataSources
import SnapKit

class ViewController: BaseViewController {
    
    let tableView = UITableView()
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Shot>>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.rx.setDelegate(self).addDisposableTo(self.disposeBag)
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        self.tableView.register(ShotViewCell.self, forCellReuseIdentifier: "cell")
        dataSource.configureCell = {_, tableView, indexPath, viewModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = viewModel.title
            return cell!
        }
        MoyaInstance.sharedInstance.getShots(page: 0, sort: "").mapToModelArr(Shot.self)
            .map({ (shots) -> [SectionModel<String, Shot>] in
                return [SectionModel(model: "cell", items: shots)]
            }).bindTo(tableView.rx.items(dataSource: dataSource)).addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

