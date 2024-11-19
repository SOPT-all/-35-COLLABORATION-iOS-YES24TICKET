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
    
    private let searchButton = UIButton().then {
        $0.setImage(.icSearchGray24, for: .normal)
    }
    
    init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(searchButton)
    }
    
    private func setLayout() {
        searchButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
    }
}
