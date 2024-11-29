//
//  TabBarController.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/14/24.
//

import UIKit

import SnapKit
import Then

final class TabBarController: UITabBarController {
    
    weak var navigationControllerDelegtae: TabBarNavigationControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        configureSubTabs()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black0
        tabBar.do {
            $0.backgroundColor = .black0
            $0.tintColor = .white0
            $0.isTranslucent = false
            $0.standardAppearance = appearance
            $0.scrollEdgeAppearance = appearance
        }
    }
    
    private func setUI() { }
    
    private func setLayout() { }
    
    private func configureSubTabs() {
        setViewControllers(
            TabBarItem.allCases.map {
                let viewController = $0.viewController
                if let viewController = viewController as? HomeViewController {
                    viewController.navigationControllerDelegate = self
                }
                let controller = UINavigationController(
                    rootViewController: viewController
                )
                controller.tabBarItem = $0.tabBarItem
                
                return controller
            },
            animated: false
        )
    }
    
}

extension TabBarController: TabBarNavigationControllerDelegate {
    
    func searchBarChange() {
        navigationControllerDelegtae?.searchBarChange()
    }
    
}
