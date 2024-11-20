//
//  MainCollectionViewCell.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/19/24.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    private let backgroundImageView = UIImageView()
    
    private let gradationView = UIImageView().then {
        $0.image = .blackGd
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .customFont(.head_eb_24)
        $0.textColor = .white0
        $0.layer.shadowColor = UIColor.black0.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = .init(width: 0, height: 4)
        $0.layer.shadowRadius = 4
    }
    
    private let areaLabel = UILabel().then {
        $0.font = .customFont(.title_b_13)
        $0.textColor = .yellow50
        $0.layer.shadowColor = UIColor.black0.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = .init(width: 0, height: 4)
        $0.layer.shadowRadius = 4
    }
    
    private let dateLabel = UILabel().then {
        $0.font = .customFont(.title_b_13)
        $0.textColor = .white0
        $0.layer.shadowColor = UIColor.black0.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = .init(width: 0, height: 4)
        $0.layer.shadowRadius = 4
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundImageView.image = nil
        titleLabel.text = ""
        areaLabel.text = ""
        dateLabel.text = ""
    }
    
    private func setUI() {
        [
            backgroundImageView,
            gradationView,
            titleLabel,
            areaLabel,
            dateLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        gradationView.snp.makeConstraints {
            $0.edges.equalTo(backgroundImageView)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(20)
        }
        
        areaLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel)
            $0.bottom.equalTo(dateLabel.snp.top).offset(-2)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel)
            $0.bottom.equalTo(areaLabel.snp.top).offset(-12)
        }
    }
    
    func configure(_ configuration: MainCellConfiguration) {
        backgroundImageView.image = configuration.image
        titleLabel.text = configuration.title
        areaLabel.text = configuration.area
        dateLabel.text = configuration.date
    }
    
}
