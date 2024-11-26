//
//  ConcertCategoryView.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/23/24.
//

import UIKit

import SnapKit

final class ConcertCategoryView: UIView {
    
    private let closedSearchBarView = ClosedSearchBarView()
    private let customNavBar = ConcertNavigationBar()
    private let tabNavigationBar = CategoryTapNavigationBar()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(320)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(320)
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item, item]
            )
            group.interItemSpacing = .fixed(10)

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)

            return section
        }

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(ConcertCollectionViewCell.self, forCellWithReuseIdentifier: ConcertCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            closedSearchBarView,
            customNavBar,
            tabNavigationBar,
            collectionView
        ].forEach {
            addSubview($0)
        }
    }
    
    private func setStyle(){
        backgroundColor = .white
    }
    
    private func setLayout() {
        closedSearchBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(47)
        }
        
        customNavBar.snp.makeConstraints {
            $0.top.equalTo(closedSearchBarView.snp.bottom).offset(57)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(39.5)
        }
        
        tabNavigationBar.snp.makeConstraints {
            $0.top.equalTo(customNavBar.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(tabNavigationBar.snp.bottom).offset(16)
            $0.horizontalEdges.bottom.equalToSuperview().inset(16)
        }
    }
    
}

extension ConcertCategoryView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConcertCollectionViewCell.reuseIdentifier, for: indexPath) as? ConcertCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.bigImageView.image = UIImage(named: "kim")
        cell.titleLabel.text = "이무진 전국투어 콘서트"
        cell.subtitleLabel.text = "대구, 청원"
        cell.dateLabel.text = "2024. 12. 07 - 12. 08"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}


