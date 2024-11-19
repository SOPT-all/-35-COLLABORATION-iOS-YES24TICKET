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
    
    private let containerView = UIView().then {
        $0.backgroundColor = .white
    }
    
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
    
    private let showTypeBackgroundView = UIView().then {
        $0.backgroundColor = .red100
        $0.layer.cornerRadius = 2
    }
    
    private let showTypeText = UILabel().then {
        $0.text = "단독"
        $0.textColor = .white0
        $0.font = UIFont.customFont(.caption_b_10)
        $0.textAlignment = .center
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
        contentView.addSubview(containerView)
        containerView.addSubview(backButton)
        containerView.addSubview(showTypeBackgroundView)
        showTypeBackgroundView.addSubview(showTypeText)
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(47)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(260)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(24)
        }
        
        showTypeBackgroundView.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(10)
        }

        showTypeText.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(3)
            $0.horizontalEdges.equalToSuperview().inset(4)
        }
    }
    
    @objc private func handleDismiss() {
        //TODO: 추 후 dismiss 연결해 줄 예정입니다.
    }
    
}


#Preview {
    
    DetailHeaderView()
    
}
