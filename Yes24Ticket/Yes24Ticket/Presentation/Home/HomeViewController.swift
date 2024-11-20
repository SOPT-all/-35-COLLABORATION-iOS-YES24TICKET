//
//  HomeViewController.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/13/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var mainFooter: MainFooterView?
    
    private let scrollView = UIScrollView()
    
    private let containerView = UIView()
    
    private lazy var mainCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createCompositionalLayout()
    ).then {
        $0.isScrollEnabled = true
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.clipsToBounds = true
        $0.register(
            MainCollectionViewCell.self,
            forCellWithReuseIdentifier: MainCollectionViewCell.cellIdentifier
        )
        $0.register(
            MainFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: MainFooterView.reusableViewIdentifier
        )
        $0.dataSource = self
        $0.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .systemGray
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        [
            mainCollectionView
        ].forEach {
            containerView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(61-44)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.frameLayoutGuide)
        }
        
        mainCollectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(containerView)
        }
        
        containerView.snp.makeConstraints {
            $0.bottom.equalTo(mainCollectionView.snp.bottom)
        }
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] (sectionIndex, _) -> NSCollectionLayoutSection? in
            guard let self else {
                return nil
            }
            switch sectionIndex {
            case 0:
                return createMainSectionLayout()
            default:
                return nil
            }
        }
    }
    
    private func createMainSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(290)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.visibleItemsInvalidationHandler = { [weak self] (visibleItems, offset, env) in
            let currentPage = Int(max(
                0,
                round(offset.x / env.container.contentSize.width)
            ))
            
            self?.mainFooter?.changeIndex(currentIndex: currentPage + 1)
        }
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .absolute(40),
                    heightDimension: .absolute(20)
                ),
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottomTrailing,
                absoluteOffset: CGPoint(
                    x: -20,
                    y: -40
                )
            )
        ]
        
        return section
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        MainCellConfiguration.mockData.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: MainFooterView.reusableViewIdentifier,
                for: indexPath
            ) as? MainFooterView else {
                return UICollectionReusableView()
            }
            // TODO: API 데이터로 수정
            footer.setMaxIndex(MainCellConfiguration.mockData.count)
            footer.changeIndex(currentIndex: 1)
            mainFooter = footer
            
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(MainCellConfiguration.mockData[indexPath.row])
        
        return cell
    }
    
}
