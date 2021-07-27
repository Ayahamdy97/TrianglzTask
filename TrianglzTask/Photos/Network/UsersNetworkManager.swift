//
//  UsersNetworkManager.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import Foundation
import Moya
import RxSwift
protocol UsersNetworkManagerProtocol {
    func fetchUsers() -> Single<[UserElement]>
}

class UsersNetworkManager:UsersNetworkManagerProtocol {
    var provider = MoyaProvider<UsersService>()
    
    func fetchUsers() -> Single<[UserElement]> {
        return provider
            .rx
            .request(.fetchUsers)
            .map([UserElement].self)
    }
}
