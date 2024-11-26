//
//  ConcertCategoryView.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/23/24.
//

import UIKit

import SnapKit
import Then

final class ConcertCategoryView: UIView {
    
    private let closedSearchBarView = ClosedSearchBarView()
    private let customNavBar = ConcertNavigationBar()
    private let tabNavigationBar = CategoryTapNavigationBar()
    
    private let concerts = MockData.concerts

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
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
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 10,
                leading: 0,
                bottom: 10,
                trailing: 0
            )
        return section
    }).then {
        $0.backgroundColor = .clear
        $0.register(ConcertCollectionViewCell.self, forCellWithReuseIdentifier: ConcertCollectionViewCell.reuseIdentifier)
        $0.dataSource = self
        $0.delegate = self
    }
    
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
    
    private func setStyle() {
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
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
}

extension ConcertCategoryView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return concerts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConcertCollectionViewCell.reuseIdentifier, for: indexPath) as? ConcertCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let concert = concerts[indexPath.row]
        cell.configure(
            image: concert.image,
            title: concert.title,
            subtitle: concert.subtitle,
            date: concert.date
        )
        return cell
    }
}
