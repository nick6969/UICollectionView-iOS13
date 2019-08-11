//
//  CVLayout.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit

enum CVLayout {
    enum ScrollType {
        case vertical
        case horizontal
    }
    
}

extension CVLayout {
    
    static func size(width: NSCollectionLayoutDimension,
                     height: NSCollectionLayoutDimension) -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
    }
    
    static func edgeInsets(_ top: CGFloat, _ leading: CGFloat, _ bottom: CGFloat, _ trailing: CGFloat) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    static func edgeInsets(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    static func edgeInsets(_ value: CGFloat) -> NSDirectionalEdgeInsets {
        return edgeInsets(value, value, value, value)
    }
    
}

extension CVLayout {
    
    static func item(width: NSCollectionLayoutDimension,
                     height: NSCollectionLayoutDimension) -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
    }
    
    static func item(width: NSCollectionLayoutDimension,
                     height: NSCollectionLayoutDimension,
                     items: [NSCollectionLayoutSupplementaryItem]) -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height),
                                      supplementaryItems: items)
    }
    
    static func groupCustom(width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            provider: @escaping NSCollectionLayoutGroupCustomItemProvider) -> NSCollectionLayoutGroup {
        let inputSize = size(width: width, height: height)
        return NSCollectionLayoutGroup.custom(layoutSize: inputSize, itemProvider: provider)
    }
    
    static func group(type: ScrollType,
                      width: NSCollectionLayoutDimension,
                      height: NSCollectionLayoutDimension,
                      subitem: NSCollectionLayoutItem,
                      count: Int) -> NSCollectionLayoutGroup {
        let inputSize = size(width: width, height: height)
        switch type {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: inputSize, subitem: subitem, count: count)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: inputSize, subitem: subitem, count: count)
        }
    }
    
    static func group(type: ScrollType,
                      width: NSCollectionLayoutDimension,
                      height: NSCollectionLayoutDimension,
                      subitems: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        let inputSize = size(width: width, height: height)
        switch type {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: inputSize, subitems: subitems)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: inputSize, subitems: subitems)
        }
    }
    
    static func section(group: NSCollectionLayoutGroup) -> NSCollectionLayoutSection {
        return NSCollectionLayoutSection(group: group)
    }
    
    static func section(groupType: ScrollType,
                        width: NSCollectionLayoutDimension,
                        height: NSCollectionLayoutDimension,
                        subitem: NSCollectionLayoutItem,
                        count: Int) -> NSCollectionLayoutSection {
        let inputGroup = group(type: groupType, width: width, height: height, subitem: subitem, count: count)
        return NSCollectionLayoutSection(group: inputGroup)
    }
    
    static func section(groupType: ScrollType,
                        width: NSCollectionLayoutDimension,
                        height: NSCollectionLayoutDimension,
                        subitems: [NSCollectionLayoutItem]) -> NSCollectionLayoutSection {
        let inputGroup = group(type: groupType, width: width, height: height, subitems: subitems)
        return NSCollectionLayoutSection(group: inputGroup)
    }
    
    static func boundarySupplementaryItem(width: NSCollectionLayoutDimension,
                                          height: NSCollectionLayoutDimension,
                                          alignment: NSRectAlignment,
                                          kind: String) -> NSCollectionLayoutBoundarySupplementaryItem {
        return boundarySupplementaryItem(size: size(width: width, height: height), alignment: alignment, kind: kind)
    }
    
    static func boundarySupplementaryItem(size: NSCollectionLayoutSize,
                                          alignment: NSRectAlignment,
                                          kind: String) -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size, elementKind: kind, alignment: alignment)
    }
    
    static func backgroundItem(kind: String) -> NSCollectionLayoutDecorationItem {
        return NSCollectionLayoutDecorationItem.background(elementKind: kind)
    }
    
}

extension CVLayout {
    
    static func header(width: NSCollectionLayoutDimension,
                       height: NSCollectionLayoutDimension) -> NSCollectionLayoutBoundarySupplementaryItem {
        return header(size: size(width: width, height: height))
    }
    
    static func header(size: NSCollectionLayoutSize) -> NSCollectionLayoutBoundarySupplementaryItem {
        return boundarySupplementaryItem(size: size, alignment: .top, kind: UICollectionView.elementKindSectionHeader)
    }
    
    static func footer(width: NSCollectionLayoutDimension,
                       height: NSCollectionLayoutDimension) -> NSCollectionLayoutBoundarySupplementaryItem {
        return footer(size: size(width: width, height: height))
    }
    
    static func footer(size: NSCollectionLayoutSize) -> NSCollectionLayoutBoundarySupplementaryItem {
        return boundarySupplementaryItem(size: size, alignment: .bottom, kind: UICollectionView.elementKindSectionFooter)
    }
    
}

extension CVLayout {
    
    static func background<T: UICollectionReusableView>(type: T.Type) -> NSCollectionLayoutDecorationItem {
        return NSCollectionLayoutDecorationItem.background(elementKind: String(describing: type))
    }
    
}

extension UICollectionViewCompositionalLayout {
    
    func registerBackground<T: UICollectionReusableView>(type: T.Type) {
        register(type, forDecorationViewOfKind: String(describing: type))
    }
    
}
