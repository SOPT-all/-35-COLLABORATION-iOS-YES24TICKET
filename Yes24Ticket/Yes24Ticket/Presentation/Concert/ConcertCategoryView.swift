//
//  ConcertCategoryView.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/23/24.
//

import UIKit
import SnapKit

final class ConcertCategoryView: UIView {
    
    private let closedSearchBarView = ClosedSearchBarView()
    private let customNavBar = ConcertNavigationBar()
    private let tabNavigationBar = CategoryTapNavigationBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(closedSearchBarView)
        addSubview(customNavBar)
        addSubview(tabNavigationBar)
    }
    
    private func setupLayout() {
        closedSearchBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(47)
        }
        
        customNavBar.snp.makeConstraints {
            $0.top.equalTo(closedSearchBarView.snp.bottom).offset(57)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(39.5)
        }
        
        tabNavigationBar.snp.makeConstraints {
            $0.top.equalTo(customNavBar.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
}

