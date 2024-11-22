//
//  DetailTableViewCell.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class DetailTableViewCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let identifier: String = "DetailTableViewCell"
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.customFont(.title_b_15)
        $0.textColor = .gray700
    }
    
    private let arrowImageView = UIImageView().then {
        $0.image = .icArrowRight16
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setUI() {
        [
            titleLabel,
            arrowImageView
        ].forEach { contentView.addSubview($0) }
    }
    
    private func setStyle() {
        addBorders(edges: [.bottom], color: .gray200, width: 1)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13.5)
            $0.leading.equalToSuperview().offset(10)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13.5)
            $0.trailing.equalToSuperview().inset(7)
        }
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
}
