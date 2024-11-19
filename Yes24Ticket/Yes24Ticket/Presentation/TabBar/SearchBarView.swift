//
//  SearchBarView.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class SearchBarView: UIView {

    private let searchTextField = UITextField().then {
        let attributedPlaceholder = NSAttributedString(
            string: "검색어를 입력해주세요",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray300,
                NSAttributedString.Key.font: UIFont.customFont(.body_r_13)
            ]
        )
        $0.attributedPlaceholder = attributedPlaceholder
        $0.font = .customFont(.body_r_13)
        
        let spacingView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 8,
                height: $0.frame.height
            )
        )
        $0.leftViewMode = .always
        $0.rightViewMode = .always
        $0.leftView = spacingView
        $0.rightView = spacingView
    }
    
    private let searchButton = UIButton().then {
        $0.setImage(.icSearchGray24, for: .normal)
    }
    
    private let containerStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
    }
    
    init() {
        super.init(frame: .zero)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        backgroundColor = .whiteDim
        layer.cornerRadius = 16
    }
    
    private func setUI() {
        [
            searchTextField,
            searchButton
        ].forEach {
            containerStackView.addArrangedSubview($0)
        }
        addSubview(containerStackView)
    }
    
    private func setLayout() {
        containerStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.verticalEdges.equalToSuperview().inset(4)
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.leading.bottom.equalTo(containerStackView)
        }
        
        searchButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
    }
    
}
