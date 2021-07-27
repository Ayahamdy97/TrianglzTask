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
    private(set) var userPublishSubject = PublishSubject<[UserElement]>()
    private(set) var errorPublishSubject = PublishSubject<Error>()
    var coordinator:AppCoordinator?
    private var disposeBag = DisposeBag()
    
    init(coordinator:AppCoordinator,userNetwork:UsersNetworkManagerProtocol = UsersNetworkManager()) {
        self.userNetwork = userNetwork
        self.coordinator = coordinator
        fetchUsers()
    }
    
    func fetchUsers() {
        userNetwork?.fetchUsers().subscribe(onSuccess: {[weak self] (users) in
            guard let self = self else {return}
            self.userPublishSubject.onNext(users)
            }, onError: { [weak self] (error) in
                guard let self = self else {return}
                self.errorPublishSubject.onNext(error)
        }).disposed(by: disposeBag)
    }
    
    
    func navigateToUserDetails(user:UserElement) {
        coordinator?.navigateToUserDetails(user: user)
    }
}
