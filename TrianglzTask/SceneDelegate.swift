//
//  SceneDelegate.swift
//  TrianglzTask
//
//  Created by Aya on 7/27/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator:AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let navController = UINavigationController()
        appCoordinator = AppCoordinator(window: window, navController: navController)
        appCoordinator?.start()
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
    }
    
}

