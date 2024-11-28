//
//  TicketTitleView.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/29/24.
//

import UIKit

final class TicketTitleView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.textColor = .gray900
        $0.font = UIFont.customFont(.head_eb_17)
        $0.text = "HYPE UP FESTIVAL"
    }
    
    private let subtitleLabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = UIFont.customFont(.title_r_12)
        $0.text = "YES24 LIVE HALL"
    }
    
    private let paginationImage = UIImageView().then {
        $0.image = UIImage(resource: .iconPagination)
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
        self.backgroundColor = .gray50
        addBorders(edges: [.bottom], color: .gray200, width: 1)
    }
    
    private func setUI() {
        [
            titleLabel,
            subtitleLabel,
            paginationImage
        ].forEach(addSubview)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(10)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(2)
            $0.leading.equalToSuperview().offset(10)
        }
        
        paginationImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().inset(10)
            
        }
    }
        
}
