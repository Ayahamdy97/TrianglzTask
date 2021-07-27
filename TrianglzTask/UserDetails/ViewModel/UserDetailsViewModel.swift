//
//  UserDetailsViewModel.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import Foundation
import RxSwift

class UserDetailsViewModel {
  
    private(set) var user:UserElement
    
    var userImageBehaviorSubject = BehaviorSubject<String>(value: "")
    var userNameBehaviorSubject = BehaviorSubject<String>(value: "")
    
    init(user:UserElement) {
        self.user = user
        print(user)
        userImageBehaviorSubject.onNext(user.avatarURL ?? "")
        userNameBehaviorSubject.onNext(user.login ?? "No Name")
    }
}
