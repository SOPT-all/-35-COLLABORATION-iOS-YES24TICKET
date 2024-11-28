//
//  ScrollUpFloatingButton.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/26/24.
//

import UIKit

final class ScrollUpFloatingButton: UIButton {
    
    private let fillUpImageView = UIImageView().then {
        $0.image = .icnFillUpI
        $0.tintColor = .white0
    }
    
    private let topTitleLabel = UILabel().then {
        $0.text = "TOP"
        $0.font = .customFont(.caption_r_11)
        $0.textColor = .white0
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
        backgroundColor = .red100
        layer.cornerRadius = 2
        layer.shadowColor = UIColor.black0.cgColor
        layer.shadowOffset = .init(
            width: 0,
            height: 1
        )
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
    }
    
    private func setUI() {
        [
            fillUpImageView,
            topTitleLabel
        ].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        fillUpImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4.5)
            $0.centerX.equalToSuperview()
        }
        
        topTitleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(4.5)
            $0.centerX.equalToSuperview()
        }
    }
    
}
