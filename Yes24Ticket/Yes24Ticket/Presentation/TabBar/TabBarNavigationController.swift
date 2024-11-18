//
//  TabBarNavigationController.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/19/24.
//

import UIKit

final class TabBarNavigationController: UINavigationController {
    
    private let statusBarView = UIView().then {
        $0.backgroundColor = .black0
    }
    
    private let containerView = UIView().then {
        $0.backgroundColor = .black0
    }
    
    private let logoButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        configuration.image = .logoYes24Ios
        $0.configuration = configuration
    }
    
    private let searchBarView = SearchBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        isNavigationBarHidden = true
    }
    
    private func setUI() {
        [
            statusBarView,
            containerView
        ].forEach {
            view.addSubview($0)
        }
        [
            logoButton,
            searchBarView
        ].forEach {
            containerView.addSubview($0)
        }
    }
    
    private func setLayout() {
        statusBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(61)
        }
        
        logoButton.snp.makeConstraints {
            $0.top.leading.bottom.equalTo(containerView).inset(8)
            $0.width.equalTo(100)
            $0.height.equalTo(45)
        }
        
        searchBarView.snp.makeConstraints {
            $0.top.equalTo(logoButton.snp.top).inset(6.5)
            $0.leading.equalTo(logoButton.snp.trailing).offset(8)
            $0.trailing.equalTo(containerView.snp.trailing).inset(12.06)
            $0.bottom.equalTo(logoButton.snp.bottom).inset(6.5)
        }
    }
    
}
