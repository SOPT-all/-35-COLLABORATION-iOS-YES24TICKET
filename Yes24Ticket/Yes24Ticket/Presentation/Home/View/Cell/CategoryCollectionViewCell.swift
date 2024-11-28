//
//  CategoryCollectionViewCell.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/20/24.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel = UILabel().then {
        $0.font = .customFont(.button_b_14)
        $0.textColor = .black0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        backgroundColor = .white0
        addBorders(
            edges: [
                .top,
                .right
            ],
            color: .gray150,
            width: 1
        )
    }
    
    private func setUI() {
        contentView.addSubview(titleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func configure(_ configuration: CategoryCellConfiguration) {
        titleLabel.text = configuration.title
    }
    
}
