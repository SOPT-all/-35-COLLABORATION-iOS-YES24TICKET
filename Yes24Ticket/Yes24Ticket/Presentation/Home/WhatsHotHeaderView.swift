//
//  WhatsHotHeaderView.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/22/24.
//

import UIKit

final class WhatsHotHeaderView: UICollectionReusableView {
    
    private let titleLabel = UILabel().then {
        $0.text = "WAHT'S HOT"
        $0.font = .customFont(.head_eb_20)
        $0.textColor = .black0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(titleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(24)
        }
    }
    
}
