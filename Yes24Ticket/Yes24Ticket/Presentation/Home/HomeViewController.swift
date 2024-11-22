//
//  HomeViewController.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/13/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var mainFooter: IndexBadgeFooterView?
    private var adFooter: IndexBadgeFooterView?
    
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
            IndexBadgeFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: IndexBadgeFooterView.reusableViewIdentifier
        )
        $0.register(
            CategoryCollectionViewCell.self,
            forCellWithReuseIdentifier: CategoryCollectionViewCell.cellIdentifier
        )
        $0.register(
            TicketRankCollectionViewCell.self,
            forCellWithReuseIdentifier: TicketRankCollectionViewCell.cellIdentifier
        )
        $0.register(
            TicketRankHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: TicketRankHeaderView.reusableViewIdentifier
        )
        $0.register(
            TicketRankFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: TicketRankFooterView.reusableViewIdentifier
        )
        $0.register(
            AdCollectionViewCell.self,
            forCellWithReuseIdentifier: AdCollectionViewCell.cellIdentifier
        )
        $0.register(
            WhatsHotCollectionViewCell.self,
            forCellWithReuseIdentifier: WhatsHotCollectionViewCell.cellIdentifier
        )
        $0.register(
            WhatsHotHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: WhatsHotHeaderView.reusableViewIdentifier
        )
        $0.register(
            FooterReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: FooterReusableView.reusableViewIdentifier
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
        view.backgroundColor = .gray100
    }
    
    private func setUI() {
        view.addSubview(mainCollectionView)
    }
    
    private func setLayout() {
        mainCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(61-44)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, _) -> NSCollectionLayoutSection? in
            guard let self else {
                return nil
            }
            switch sectionIndex {
            case 0:
                return createMainSectionLayout()
            case 1:
                return createCategorySectionLayout()
            case 2:
                return createTicketRankSectionLayout()
            case 3:
                return createAdSectionLayout()
            case 4:
                return createWhatsHotSectionLayout()
            default:
                return nil
            }
        }
        layout.register(
            TicketRankSectionBackgroundView.self,
            forDecorationViewOfKind: "ticket-background"
        )
        
        return layout
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
    
    private func createCategorySectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0/3.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item, item, item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 0,
            leading: 0,
            bottom: 8,
            trailing: 0
        )
        
        return section
    }
    
    private func createTicketRankSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(120),
            heightDimension: .absolute(170)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(132),
            heightDimension: .absolute(170)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = .init(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 2
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(
            top: 12,
            leading: 0,
            bottom: 12,
            trailing: 0
        )
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(30)
                ),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading
            ),
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(36)
                ),
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
        ]
        section.decorationItems = [
            NSCollectionLayoutDecorationItem.background(elementKind: "ticket-background")
        ]
        
        return section
    }
    
    private func createAdSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(160)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 8,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        section.orthogonalScrollingBehavior = .groupPaging
        section.visibleItemsInvalidationHandler = { [weak self] (visibleItems, offset, env) in
            let currentPage = Int(max(
                0,
                round(offset.x / env.container.contentSize.width)
            ))
            self?.adFooter?.changeIndex(currentIndex: currentPage + 1)
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
    
    private func createWhatsHotSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(231)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(231)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = .init(
            top: 0,
            leading: 5,
            bottom: 0,
            trailing: 5
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(74)
                ),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            ),
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(179)
                ),
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
        ]
        
        return section
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        switch indexPath.section {
        case 1:
            if indexPath.row == 0 {
                // TODO: present Concert ViewController
            }
        default:
            break
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        switch section {
        case 0:
            MainCellConfiguration.mockData.count
        case 1:
            CategoryCellConfiguration.mockData.count
        case 2:
            TicketRankCellConfiguration.mockData.count
        case 3:
            AdCellConfiguration.mockData.count
        case 4:
            WhatsHotCellConfiguration.mockData.count
        default:
            0
        }
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
                withReuseIdentifier: IndexBadgeFooterView.reusableViewIdentifier,
                for: indexPath
            ) as? IndexBadgeFooterView else {
                return UICollectionReusableView()
            }
            // TODO: API 데이터로 수정
            footer.setDimMode(isWhite: true)
            footer.setMaxIndex(MainCellConfiguration.mockData.count)
            footer.changeIndex(currentIndex: 1)
            mainFooter = footer
            
            return footer
        case 2:
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: TicketRankHeaderView.reusableViewIdentifier,
                    for: indexPath
                ) as? TicketRankHeaderView else {
                    return UICollectionReusableView()
                }
                
                return header
            case UICollectionView.elementKindSectionFooter:
                guard let footer = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionFooter,
                    withReuseIdentifier: TicketRankFooterView.reusableViewIdentifier,
                    for: indexPath
                ) as? TicketRankFooterView else {
                    return UICollectionReusableView()
                }
                
                return footer
            default:
                return UICollectionReusableView()
            }
        case 3:
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: IndexBadgeFooterView.reusableViewIdentifier,
                for: indexPath
            ) as? IndexBadgeFooterView else {
                return UICollectionReusableView()
            }
            // TODO: API 데이터로 수정
            footer.setMaxIndex(AdCellConfiguration.mockData.count)
            footer.changeIndex(currentIndex: 1)
            footer.setDimMode(isWhite: false)
            adFooter = footer
            
            return footer
        case 4:
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: WhatsHotHeaderView.reusableViewIdentifier,
                    for: indexPath
                ) as? WhatsHotHeaderView else {
                    return UICollectionReusableView()
                }
                
                return header
            case UICollectionView.elementKindSectionFooter:
                guard let footer = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionFooter,
                    withReuseIdentifier: FooterReusableView.reusableViewIdentifier,
                    for: indexPath
                ) as? FooterReusableView else {
                    return UICollectionReusableView()
                }
                
                return footer
            default:
                return UICollectionReusableView()
            }
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MainCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? MainCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(MainCellConfiguration.mockData[indexPath.row])
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(CategoryCellConfiguration.mockData[indexPath.row])
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TicketRankCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? TicketRankCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(TicketRankCellConfiguration.mockData[indexPath.row])
            
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AdCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? AdCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(AdCellConfiguration.mockData[indexPath.row])
            
            return cell
        case 4:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WhatsHotCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? WhatsHotCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(WhatsHotCellConfiguration.mockData[indexPath.row])
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
}
