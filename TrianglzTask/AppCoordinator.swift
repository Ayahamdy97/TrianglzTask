//
//  AppCoordinator.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit


class AppCoordinator {
    let window:UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    func start()  {
        let viewController = PhotosViewController.instantiate(storyboardName: "Main")
        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
