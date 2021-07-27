//
//  PhotosNetworkManager.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol PhotosNetworkManagerProtocol {
    func fetchPhotos()
}

class UsersNetworkManager:PhotosNetworkManagerProtocol {
    
    var prvider = MoyaProvider<UsersService>()
    
    func fetchPhotos() {
        
    }
    
    
}
