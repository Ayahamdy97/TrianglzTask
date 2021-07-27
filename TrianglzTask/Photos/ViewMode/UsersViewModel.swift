//
//  UsersViewModel.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import Foundation
import RxSwift

class UsersViewModel {
  
    private var userNetwork: UsersNetworkManagerProtocol?
    private(set) var userSubject = PublishSubject<[UserElement]>()
    private(set) var errorSubject = PublishSubject<Error>()
    private var disposeBag = DisposeBag()
    
    init(userNetwork:UsersNetworkManagerProtocol = UsersNetworkManager()) {
        self.userNetwork = userNetwork
        fetchUsers()
    }
    
    func fetchUsers() {
        userNetwork?.fetchUsers().subscribe(onSuccess: {[weak self] (user) in
            guard let self = self else {return}
            self.userSubject.onNext(user)
            }, onError: { [weak self] (error) in
                guard let self = self else {return}
                self.errorSubject.onNext(error)
        }).disposed(by: disposeBag)
    }
}
