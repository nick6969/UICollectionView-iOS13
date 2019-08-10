//
//  UICollectionViewExtension.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit

// swiftlint:disable force_cast
extension UICollectionView {
    
    func registerSectionHeader<T: UICollectionReusableView>(type: T.Type) {
        register(type,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: String(describing: type))
    }
    
    func registerSectionHeaders<T: UICollectionReusableView>(types: [T.Type]) {
        types.forEach { registerSectionHeader(type: $0) }
    }
    
    func registerSectionHeaderNib<T: UICollectionReusableView>(type: T.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: className)
    }
    
    func dequeueReusableSectionHeader<T: UICollectionReusableView>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                withReuseIdentifier: String(describing: type),
                                                for: indexPath) as! T
    }
    
    func registerSectionFooter<T: UICollectionReusableView>(type: T.Type) {
        register(type,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: String(describing: type))
    }
    
    func registerSectionFooters<T: UICollectionReusableView>(types: [T.Type]) {
        types.forEach { registerSectionFooter(type: $0) }
    }
    
    func registerSectionFooterNib<T: UICollectionReusableView>(type: T.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: className)
    }
    
    func dequeueReusableSectionFooter<T: UICollectionReusableView>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                withReuseIdentifier: String(describing: type),
                                                for: indexPath) as! T
    }
    
    func registerCell<T: UICollectionViewCell>(type: T.Type) {
        register(type,
                 forCellWithReuseIdentifier: String(describing: type))
    }
    
    func registerCells<T: UICollectionViewCell>(types: [T.Type]) {
        types.forEach { registerCell(type: $0) }
    }
    
    func registerNibCell<T: UICollectionViewCell>(type: T.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil),
                 forCellWithReuseIdentifier: className)
    }
    
    func registerNibCells<T: UICollectionViewCell>(types: [T.Type]) {
        types.forEach { registerNibCell(type: $0) }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: type),
                                   for: indexPath) as! T
    }
}
// swiftlint:enable force_cast
