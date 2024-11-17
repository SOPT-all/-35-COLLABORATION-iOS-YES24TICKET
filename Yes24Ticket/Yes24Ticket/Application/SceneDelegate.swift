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
        
        //TODO: TabBar로 변경
        let rootController = UINavigationController(rootViewController: HomeViewController())
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .black
        rootController.navigationBar.scrollEdgeAppearance = appearance
        
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
    
}
