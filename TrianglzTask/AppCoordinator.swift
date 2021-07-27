//
//  AppCoordinator.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit
import RxCocoa

class AppCoordinator {
    let window:UIWindow
    var navigationController: UINavigationController?
    init(window:UIWindow, navController:UINavigationController) {
        self.window = window
        self.navigationController = navController
    }
    
    func start()  {
        let usersViewController = UsersViewController.instantiate(storyboardName: "Main")
        usersViewController.usersViewModel = UsersViewModel(coordinator: self, userNetwork: UsersNetworkManager())
        navigationController?.pushViewController(usersViewController, animated: true)
        
    }
    
    func navigateToUserDetails(user:UserElement)  {
        let userDetailsViewController = UserDetailsViewController.instantiate(storyboardName: "UserDetails")
        userDetailsViewController.userDetailsViewModel = UserDetailsViewModel(user: user)
        navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
    
    
}
