//
//  RemainSeatCollectionViewCell.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/29/24.
//

import UIKit

final class RemainSeatCollectionViewCell: UICollectionViewCell {
    
    private let seatLabel = UILabel().then {
        $0.text = "스탠딩"
        $0.font = UIFont.customFont(.body_m_13)
        $0.textColor = .gray700
    }
    
    private let seatDetailLabel = UILabel().then {
        $0.text = "P석"
        $0.font = UIFont.customFont(.body_m_13)
        $0.textColor = .gray700
    }
    
    private let seatRemainLabel = UILabel().then {
        $0.text = "39석"
        $0.font = UIFont.customFont(.body_m_13)
        $0.textColor = .gray700
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        addBorders(
            edges: [.bottom],
            color: .gray250,
            width: 1
            
        )
    }
    
    private func setUI() {
        [
            seatLabel,
            seatDetailLabel,
            seatRemainLabel
        ].forEach(addSubview)
    }
    
    private func setLayout() {
        seatLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        seatDetailLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(seatLabel.snp.trailing).offset(3)
        }
        
        seatRemainLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(seatDetailLabel.snp.trailing).offset(66)
        }
    }
    
    func configure(type: String, remaining: String) {
        seatDetailLabel.text = type
        seatRemainLabel.text = "\(remaining)석"
        if remaining == "0" {
            seatLabel.textColor = .gray250
            seatDetailLabel.textColor = .gray250
            seatRemainLabel.textColor = .gray250
        }
    }
    
}
