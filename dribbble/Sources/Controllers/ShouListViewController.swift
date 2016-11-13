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

class ShotListViewController: BaseViewController {
    
    let tableView = UITableView()
    let dataSource = RxTableViewSectionedReloadDataSource<ShotListSection>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure(viewModel: ShotListViewModel(disposeBag: self.disposeBag))
        self.tableView.rx.setDelegate(self).addDisposableTo(self.disposeBag)
        self.view.addSubview(tableView)
        self.tableView.register(ShotViewCell.self, forCellReuseIdentifier: ShotViewCell.identifier)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    func configure(viewModel: ShotListViewModel) {
        self.dataSource.configureCell = {_, tableView, indexPath, viewModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: ShotViewCell.identifier, for: indexPath) as! ShotViewCell
            cell.update(shot: viewModel)
            return cell
        }
        self.tableView.rx.itemSelected
            .bindTo(viewModel.itemDidSelect)
            .addDisposableTo(self.disposeBag)
        viewModel.sections
            .drive(self.tableView.rx.items(dataSource: self.dataSource))
            .addDisposableTo(self.disposeBag)
    }
}

extension ShotListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

