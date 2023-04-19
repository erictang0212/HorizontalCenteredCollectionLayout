//
//  UICollectionView+Extension.swift
//  SwiftLibrary
//
//  Created by ShaoHuan Tang on 2023/4/17.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    func registerCellNib<T: UICollectionViewCell>(_ type: T.Type) {
        let identifierId = String(describing: T.self)
        let nibCell = UINib(nibName: identifierId, bundle: nil)
        self.register(nibCell, forCellWithReuseIdentifier: identifierId)
    }
    
    func dequeueCell<T:UICollectionViewCell>(_ type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
