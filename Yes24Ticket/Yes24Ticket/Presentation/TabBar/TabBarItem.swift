//
//  TabBarItem.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/14/24.
//

import UIKit

enum TabBarItem: CaseIterable {
    
    case home
    case category
    case search
    case myPage
    
    var navigationController: UINavigationController {
        let controller = UINavigationController(
            rootViewController: viewController
        )
        
        controller.tabBarItem = tabBarItem
        return controller
    }
    
}

extension TabBarItem {
    
    private var viewController: UIViewController {
        switch self {
        case .home:
            HomeViewController()
        case .category:
            CategoryViewController()
        case .search:
            SearchViewController()
        case .myPage:
            MyPageViewController()
        }
    }
    
    private var tabBarItem: UITabBarItem {
        let item = UITabBarItem(
            title: title,
            image: image?.withRenderingMode(.alwaysTemplate),
            selectedImage: image?.withRenderingMode(.alwaysTemplate)
        )
        item.setTitleTextAttributes(
            [.font: UIFont.customFont(.caption_r_10)],
            for: .normal
        )
        item.setTitleTextAttributes(
            [.font: UIFont.customFont(.caption_r_10)],
            for: .selected
        )
        
        return item
    }
    
    private var title: String {
        switch self {
        case .home:
            "홈"
        case .category:
            "카테고리"
        case .search:
            "검색"
        case .myPage:
            "마이"
        }
    }
    
    private var image: UIImage? {
        switch self {
        case .home:
                .icHomeGray24
        case .category:
                .icCategoryGray24
        case .search:
                .icSearchGray24
        case .myPage:
                .icMyGray24
        }
    }
    
}
