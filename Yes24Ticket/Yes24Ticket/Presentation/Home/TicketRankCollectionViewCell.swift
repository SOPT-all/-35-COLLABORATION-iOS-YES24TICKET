//
//  TicketRankCollectionViewCell.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/21/24.
//

import UIKit

final class TicketRankCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    private let gradationView = UIImageView().then {
        $0.image = .blackMiniGd
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    private let rankLabel = UILabel().then {
        $0.font = .customFont(.head_b_36)
        $0.textColor = .white0
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        rankLabel.text = ""
    }
    
    private func setStyle() {
        layer.cornerRadius = 4
    }
    
    private func setUI() {
        [
            imageView,
            gradationView,
            rankLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        gradationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView).inset(8)
            $0.bottom.equalTo(imageView)
        }
    }
    
    func configure(_ configuration: TicketRankConfiguration) {
        imageView.image = configuration.image
        rankLabel.text = "\(configuration.rank)"
    }
    
}
