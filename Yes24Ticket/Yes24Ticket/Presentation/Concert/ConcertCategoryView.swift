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
    
    private var concerts: [Concert] = []
    private let apiService = APIService()
    
    let filterButton = UIButton().then {
        $0.setTitle("정렬", for: .normal)
        $0.setTitleColor(.gray300, for: .normal)
        $0.titleLabel?.font = .customFont(.caption_r_11)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray150.cgColor
        $0.layer.cornerRadius = 2
        
        $0.setImage(UIImage(named: "icn_array_18_i"), for: .normal)
        $0.tintColor = .gray300
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    func updateConcerts(_ newConcerts: [Concert]) {
            self.concerts = newConcerts
            self.collectionView.reloadData()
        }
    
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
                top: 37,
                leading: 0,
                bottom: 10,
                trailing: 0
            )
            
            let footerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(179)
            )
            let footer = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: footerSize,
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
            section.boundarySupplementaryItems = [footer]
            
            return section
        }).then {
            $0.backgroundColor = .clear
            $0.register(ConcertCollectionViewCell.self, forCellWithReuseIdentifier: ConcertCollectionViewCell.reuseIdentifier)
            $0.register(FooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterReusableView")
            $0.dataSource = self
            $0.delegate = self
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
        fetchConcertData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            filterButton,
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
            $0.top.equalTo(tabNavigationBar.snp.bottom).offset(0)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        filterButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.top.equalTo(tabNavigationBar.snp.bottom).offset(8)
            $0.width.equalTo(56)
            $0.height.equalTo(23)
        }
        
        bringSubviewToFront(filterButton)
    }
    
    private func fetchConcertData() {
        apiService.fetchMainSection { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let mainSection):
                self.concerts = mainSection.map {
                    Concert(
                        imageURL: $0.imageURL,
                        title: $0.title,
                        subtitle: $0.area,
                        date: $0.date
                    )
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching concert data: \(error)")
            }
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
        cell.configure(with: concert)
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            guard let footerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: "FooterReusableView",
                for: indexPath
            ) as? FooterReusableView else {
                return UICollectionReusableView()
            }
            return footerView
        }
        return UICollectionReusableView()
    }
    
}
