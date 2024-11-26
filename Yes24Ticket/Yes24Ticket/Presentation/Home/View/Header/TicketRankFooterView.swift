//
//  TicketRankFooterView.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/21/24.
//

import UIKit

final class TicketRankFooterView: UICollectionReusableView {
    
    private let announcementLabel = UILabel().then {
        $0.text = "티켓 오픈/공지"
        $0.font = .customFont(.title_b_12)
        $0.textColor = .black0
    }
    
    private let indicatorImageView = UIImageView().then {
        $0.image = .icnBlueArrow
    }
    
    private let dividerImageView = UIImageView().then {
        $0.image = .divider
    }
    
    private let contentLabel = UILabel().then {
        $0.text = "뮤지컬<시라노>2차 티켓오픈 안내"
        $0.font = .customFont(.body_sb_12)
        $0.textColor = .gray500
    }
    
    private let dropDownButton = UIButton().then {
        $0.setImage(
            .icArrowDown16,
            for: .normal
        )
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
        addBorders(
            edges: [
                .top,
                .left,
                .right,
                .bottom
            ],
            color: .gray150,
            width: 1
        )
        backgroundColor = .white0
    }
    
    private func setUI() {
        [
            announcementLabel,
            indicatorImageView,
            dividerImageView,
            contentLabel,
            dropDownButton
        ].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        announcementLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        indicatorImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(announcementLabel.snp.trailing)
        }
        
        dividerImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(indicatorImageView.snp.trailing).offset(6)
        }
        
        contentLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(dividerImageView.snp.trailing).offset(6)
        }
        
        dropDownButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
        }
    }
    
}
