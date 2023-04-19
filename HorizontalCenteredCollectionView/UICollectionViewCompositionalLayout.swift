//
//  UICollectionViewCompositionalLayout.swift
//  HorizontalCenteredCollectionView
//
//  Created by ShaoHuan Tang on 2023/4/19.
//

import UIKit

extension HorizontalCenteredCollectionViewController {
    
    /// iOS 13.0 以上使用 UICollectionViewCompositionalLayout 完成 layout
    /// 回到 Controller 只需要以下兩行與 DataSource 即可
    /// collectionView.collectionViewLayout = generateLayout()
    /// collectionView.isScrollEnabled = false
    func generateLayout() -> UICollectionViewLayout {
        let space: Double = 10
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: space,
                                                     bottom: 0, trailing: space)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return UICollectionViewCompositionalLayout(section: section)
    }
}
