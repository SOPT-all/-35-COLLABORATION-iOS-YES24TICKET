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
    
    private lazy var containerView = UIView().then {
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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(backButton)
    }
    
    private func configureLayout() {
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
    }
    
    @objc private func handleDismiss() {
        //TODO: 추 후 dismiss 연결해 줄 예정입니다.
    }
    
}
