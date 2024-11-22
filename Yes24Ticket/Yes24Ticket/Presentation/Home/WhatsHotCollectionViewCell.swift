//
//  WhatsHotCollectionViewCell.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/22/24.
//

import UIKit

final class WhatsHotCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView().then {
        $0.clipsToBounds = true
    }
    
    private let commentLabel = UILabel().then {
        $0.font = .customFont(.body_sb_12)
        $0.textColor = .gray400
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .customFont(.title_eb_17)
        $0.textColor = .black0
    }
    
    private let areaLabel = UILabel().then {
        $0.font = .customFont(.body_b_14)
        $0.textColor = .black0
    }
    
    private let dividerImageView = UIImageView(image: .divider)
    
    private let dateLabel = UILabel().then {
        $0.font = .customFont(.body_b_14)
        $0.textColor = .gray250
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
        commentLabel.text = ""
        titleLabel.text = ""
        areaLabel.text = ""
        dateLabel.text = ""
    }
    
    private func setStyle() {
        backgroundColor = .white0
        layer.cornerRadius = 3
    }
    
    private func setUI() {
        [
            imageView,
            commentLabel,
            titleLabel,
            areaLabel,
            dividerImageView,
            dateLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(147)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(commentLabel.snp.bottom).offset(6)
            $0.leading.equalTo(commentLabel)
        }
        
        areaLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(commentLabel)
        }
        
        dividerImageView.snp.makeConstraints {
            $0.centerY.equalTo(areaLabel)
            $0.leading.equalTo(areaLabel.snp.trailing).offset(8)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalTo(areaLabel)
            $0.leading.equalTo(dividerImageView.snp.trailing).offset(8)
        }
    }
    
    func configure(_ configuration: WhatsHotCellConfiguration) {
        imageView.image = configuration.image
        commentLabel.text = configuration.comment
        titleLabel.text = configuration.title
        areaLabel.text = configuration.area
        dateLabel.text = configuration.date
    }
    
}
