//
//  HorizontalCenteredCollectionViewController.swift
//  HorizontalCenteredCollectionView
//
//  Created by ShaoHuan Tang on 2023/4/19.
//

import UIKit

class HorizontalCenteredCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var colors: [UIColor] = [.blue, .brown, .green,
                                     .red, .yellow, .cyan,
                                     .orange, .magenta]
    
    private var itemSize: CGSize?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Method
    private func setupView() {
        collectionView.registerCell(HorizontalCenteredCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        
//        collectionView.collectionViewLayout = generateLayout()
//        collectionView.isScrollEnabled = false
    }
    
    /// 根據 item size 去算出 first item 與 last item 的左右 padding
    private func calcSectionInset() -> UIEdgeInsets {
        guard let itemSize = itemSize else { return .zero }
        let screeWidth = collectionView.frame.size.width
        let sectionPadding = (screeWidth - itemSize.width) / 2
        return UIEdgeInsets(top: 0, left: sectionPadding, bottom: 0, right: sectionPadding)
    }
    
    
    /// 根據 first item 與 last item 的左右 padding 與希望露出的 size 去計算 item space
    /// - Parameter peekSize: 希望下一頁與前一頁露出的 size
    /// - Returns: item space
    private func calcItemSpace(peekSize: CGFloat) -> CGFloat {
        let sectionInset = calcSectionInset()
        return sectionInset.right - peekSize
    }
}

// MARK: - UICollectionViewDataSource

extension HorizontalCenteredCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(HorizontalCenteredCollectionViewCell.self, indexPath: indexPath)
        cell.setupColor(colors[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HorizontalCenteredCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        itemSize = CGSize(width: collectionView.frame.width - 100,
                          height: collectionView.frame.height - 20)
        return itemSize ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return calcItemSpace(peekSize: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return calcSectionInset()
    }
}

// MARK: - UIScrollViewDelegate

extension HorizontalCenteredCollectionViewController: UIScrollViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // 不讓 collectionView 可以滾超過一個 item
        targetContentOffset.pointee = scrollView.contentOffset
        // 根據可視 item 得到 index
        var indexes = self.collectionView.indexPathsForVisibleItems
        indexes.sort()
        var index = indexes.first!
        
        // 只需處理往下一過 item 滾動
        // 根據 velocity 加速度判斷前進 index，並檢查是否超過 index
        if velocity.x > 0.5,
           index.row < colors.count - 1 {
            index.row = index.row + 1
        }
        // 滾動到下一頁或上一頁
        self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
}
