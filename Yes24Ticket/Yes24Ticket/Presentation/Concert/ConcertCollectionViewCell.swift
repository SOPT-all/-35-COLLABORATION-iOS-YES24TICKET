//
//  ConcertCollectionViewCell.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/22/24.
//

import UIKit

import SnapKit
import Then

final class ConcertCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ConcertCollectionViewCell"
    
    private let bigImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "placeholder") 
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .customFont(.title_b_13)
        $0.textColor = .gray900
        $0.numberOfLines = 1
        $0.textAlignment = .center
    }
    
    private let subtitleLabel = UILabel().then {
        $0.font = .customFont(.caption_m_11)
        $0.textColor = .gray800
        $0.textAlignment = .center
    }
    
    private let dateLabel = UILabel().then {
        $0.font = .customFont(.caption_m_11)
        $0.textColor = .gray300
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            bigImageView,
            titleLabel,
            subtitleLabel,
            dateLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        bigImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(172)
            $0.height.equalTo(247)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(bigImageView.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(8)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.right.equalToSuperview().inset(8)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            $0.left.right.equalToSuperview().inset(8)
        }
    }
    
    func configure(with model: Concert) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        dateLabel.text = model.date
        
        if let imageURL = model.imageURL {
            loadImage(from: imageURL)
        } else {
            bigImageView.image = UIImage(named: "placeholder")
        }
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            bigImageView.image = UIImage(named: "placeholder")
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.bigImageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self.bigImageView.image = UIImage(named: "placeholder")
                }
            }
        }
    }
}
