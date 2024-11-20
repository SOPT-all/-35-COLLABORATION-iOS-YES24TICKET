//
//  ClosedSearchBarView.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/20/24.
//

import UIKit
import SnapKit
import Then

class ClosedSearchBarView: UIView {

    private let statusBarView = UIView().then {
        $0.backgroundColor = .black
    }

    private let containerView = UIView().then {
        $0.backgroundColor = .black
    }

    private let logoButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "logoYes24Ios")
        $0.configuration = configuration
    }

    private let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "icSearchGray24"), for: .normal)
    }

    init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
        backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        addSubview(statusBarView)
        addSubview(containerView)
        containerView.addSubview(logoButton)
        containerView.addSubview(searchButton)
    }

    private func setLayout() {
        statusBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }

        containerView.snp.makeConstraints {
            $0.top.equalTo(statusBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(61)
        }

        logoButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(45)
        }

        searchButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
    }
}
