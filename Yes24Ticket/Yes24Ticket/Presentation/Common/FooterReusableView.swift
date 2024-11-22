//
//  FooterReusableView.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/23/24.
//

import UIKit

final class FooterReusableView: UICollectionReusableView {
    
    private let footer = Footer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(footer)
    }
    
    private func setLayout() {
        footer.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
