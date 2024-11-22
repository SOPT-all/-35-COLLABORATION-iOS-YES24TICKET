//
//  DetailHeaderView.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class DetailHeaderView: UITableViewHeaderFooterView {
    
    private static let reuseIdentifier: String = "DetailHeaderView"
    
    private let headerDetailView = HeaderDetailView()
    
    private let ticketDetailView = TicketDetailView()
    
    private lazy var backButton = UIButton().then {
        $0.setImage(
            UIImage(resource: .icnArrowLeft24),
            for: .normal
        )
        $0.addTarget(
            self,
            action: #selector(handleDismiss),
            for: .touchUpInside
        )
    }
    
    private lazy var likeButton = UIButton().then {
        $0.setImage(
            .icHeartGray36,
            for: .normal
        )
        $0.setImage(
            .icHeart36,
            for: .selected
        )
        $0.addTarget(
            self,
            action: #selector(likeButtonTapped),
            for: .touchUpInside
        )
    }
    
    private let likeLabel = UILabel().then {
        $0.text = "162"
        $0.font = UIFont.customFont(.body_b_14)
        $0.textColor = .gray600
    }
    
    private lazy var shareButton = UIButton().then {
        $0.setImage(
            .icIShare36,
            for: .normal
        )
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            headerDetailView,
            ticketDetailView,
            backButton,
            likeButton,
            likeLabel,
            shareButton
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(24)
        }
        
        headerDetailView.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(230)
        }
        
        ticketDetailView.snp.makeConstraints {
            $0.top.equalTo(headerDetailView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(162)
        }
        
        likeButton.snp.makeConstraints {
            $0.bottom.equalTo(headerDetailView.snp.bottom).inset(10)
            $0.trailing.equalTo(likeLabel.snp.leading).offset(-2)
        }
        
        likeLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeButton)
            $0.trailing.equalTo(shareButton.snp.leading).offset(-4)
        }
        
        shareButton.snp.makeConstraints {
            $0.centerY.equalTo(likeButton)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    @objc private func handleDismiss() {
        // TODO: 추 후 연결 예정
    }
    
    @objc private func likeButtonTapped() {
        likeButton.isSelected.toggle()
        // TODO: 추 후 로직 연결 예정
    }
    
    func configure(with model: Concert) {
        headerDetailView.configure(with: model)
        ticketDetailView.configure(with: model)
    }
}

#Preview {
    
    let view = DetailHeaderView().then {
        $0.configure(with: .mockData)
    }
    view
    
}
