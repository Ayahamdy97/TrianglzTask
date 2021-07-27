//
//  UsersViewController.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class UsersViewController: UIViewController,Storyboarded {
    
    var usersViewModel:UsersViewModel?
    private var disposeBag = DisposeBag()
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindDataToView()
    }
    
    func bindDataToView() {
        usersViewModel?.userPublishSubject.observeOn(MainScheduler.instance).bind(to: usersTableView
            .rx
            .items(cellIdentifier: "UsersTableViewCell", cellType: UsersTableViewCell.self)){ index,model,cell in
                cell.configureCell(user: model)
        }.disposed(by: disposeBag)
        
        usersViewModel?
            .errorPublishSubject
            .subscribe(onNext: { [weak self] (error) in
                guard let self = self else {return}
                self.showAlert(title: "Error", message: "Error occured while retrieving data")
            }).disposed(by: disposeBag)
        
        usersTableView
            .rx
            .modelSelected(UserElement.self).subscribe(onNext: { [weak self] (user) in
                guard let self = self else {return}
                self.usersViewModel?.navigateToUserDetails(user: user)
            }).disposed(by: disposeBag)
    }
    
}
