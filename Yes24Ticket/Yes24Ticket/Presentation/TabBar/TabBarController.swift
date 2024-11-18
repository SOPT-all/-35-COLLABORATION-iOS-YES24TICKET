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
    }
    
    private func setStyle() {
        tabBar.do {
            $0.backgroundColor = .black0
            $0.tintColor = .white0
        }
    }
    
    private func configureSubTabs() {
        setViewControllers(
            TabBarItem.allCases.map {
                $0.navigationController
            },
            animated: false
        )
    }
    
}
