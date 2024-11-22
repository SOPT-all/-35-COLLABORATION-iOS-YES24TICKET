//
//  SceneDelegate.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/13/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        window = UIWindow(windowScene: windowScene)
        
        let rootController = TabBarNavigationController(
            rootViewController: TabBarController()
        )
        
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
    
}
