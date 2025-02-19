//
//  ClosedSearchBarView.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/20/24.
//

import UIKit

import SnapKit
import Then

final class ClosedSearchBarView: UIView {
    
    private let containerView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let logoButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage.logoYes24Ios
        $0.configuration = configuration
    }
    
    private let searchButton = UIButton().then {
        $0.setImage(
            .icSearchWhite24,
            for: .normal
        )
    }
    
    init() {
        super.init(frame: .zero)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        backgroundColor = .black
    }
    
    private func setUI() {
        addSubview(containerView)
        containerView.addSubview(logoButton)
        containerView.addSubview(searchButton)
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(47)
        }
        
        logoButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(45)
        }
        
        searchButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
    }
    
}
