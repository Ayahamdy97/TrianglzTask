//
//  Storyboarded.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboardName:String) -> Self
}

extension Storyboarded where Self: UIViewController{
    static func instantiate(storyboardName:String) -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        let id = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
    
}
