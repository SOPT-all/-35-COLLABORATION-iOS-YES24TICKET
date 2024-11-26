//
//  TicketRankHeaderView.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/21/24.
//

import UIKit

final class TicketRankHeaderView: UICollectionReusableView {
    
    private let linkLabelButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        var attributedString = AttributedString("실시간 티켓랭킹")
        attributedString.font = UIFont.customFont(.head_b_15)
        configuration.attributedTitle = attributedString
        configuration.contentInsets = .zero
        configuration.baseForegroundColor = .black0
        $0.configuration = configuration
    }
    
    private let linkButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        configuration.image = .icArrowRightBlue16
        configuration.contentInsets = .zero
        $0.configuration = configuration
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
            edges: [.top],
            color: .gray150,
            width: 1
        )
    }
    
    private func setUI() {
        [
            linkLabelButton,
            linkButton
        ].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        linkLabelButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(10)
        }
        
        linkButton.snp.makeConstraints {
            $0.centerY.equalTo(linkLabelButton)
            $0.leading.equalTo(linkLabelButton.snp.trailing)
        }
    }
    
}
