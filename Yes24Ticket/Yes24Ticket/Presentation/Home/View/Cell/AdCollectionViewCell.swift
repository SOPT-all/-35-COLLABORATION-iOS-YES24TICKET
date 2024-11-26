//
//  AdCollectionViewCell.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/21/24.
//

import UIKit

final class AdCollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
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
        imageView.image = nil
    }
    
    private func setUI() {
        contentView.addSubview(imageView)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configure(_ configuration: AdCellConfiguration) {
        imageView.image = configuration.image
    }
    
}
