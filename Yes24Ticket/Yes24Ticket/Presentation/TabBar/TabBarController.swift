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
                $0.navigationController
            },
            animated: false
        )
    }
    
}
