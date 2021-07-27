//
//  PhotosService.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import Foundation
import Moya


enum UsersService {
    case fetchUsers
}


extension UsersService:TargetType{
    var baseURL: URL {
          URL(string:"https://api.github.com")!
    }
    
    var path: String {
        "/users"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        nil
    }
    
    
}
