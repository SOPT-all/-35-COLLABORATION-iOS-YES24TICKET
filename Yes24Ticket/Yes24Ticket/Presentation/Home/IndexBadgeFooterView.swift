//
//  IndexBadgeFooterView.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/20/24.
//

import UIKit

final class IndexBadgeFooterView: UICollectionReusableView {
    
    private var maxIndex: Int?
    
    private lazy var indexLabel = UILabel().then {
        $0.font = .customFont(.caption_b_10)
        $0.textColor = .white0
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        layer.cornerRadius = 10
    }
    
    private func setUI() {
        addSubview(indexLabel)
    }
    
    private func setLayout() {
        indexLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func changeIndex(currentIndex: Int) {
        if let maxIndex {
            indexLabel.text = "\(currentIndex)/\(maxIndex)"
        } else {
            indexLabel.text = ""
        }
    }
    
    func setMaxIndex(_ maxIndex: Int) {
        self.maxIndex = maxIndex
        indexLabel.text = "1/\(maxIndex)"
    }
    
    func setDimMode(isWhite: Bool) {
        if isWhite {
            backgroundColor = .whiteDim
            layer.shadowColor = UIColor.black0.cgColor
            layer.shadowOffset = .init(width: 0, height: 4)
            layer.shadowOpacity = 0.25
            layer.shadowRadius = 4
        } else {
            backgroundColor = .blackDim
        }
    }
    
}

extension IndexBadgeFooterView: FooterBadgeDelegate {
    
    func badgeIndexChanged(_ index: Int) {
        if let maxIndex {
            indexLabel.text = "\(index)/\(maxIndex)"
        } else {
            indexLabel.text = ""
        }
    }
    
}

protocol FooterBadgeDelegate: AnyObject {
    
    func badgeIndexChanged(_ index: Int)
    
}
