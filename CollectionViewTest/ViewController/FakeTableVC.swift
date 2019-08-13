//
//  FakeTableVC.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit

final class FakeTableVC: UIViewController {
    private
    lazy var collectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.registerCell(type: TextCollectionViewCell.self)
        collectionView.registerSectionHeader(type: BasicReusableView.self)
        collectionView.registerSectionFooter(type: BasicReusableView.self)
        return collectionView
    }()
    
    private
    var dataSource: UICollectionViewDiffableDataSource<Int, Int>!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.mLaySafe(pin: .allZero)
        setupDataSource()
        updateUI()
    }
    
    func setupDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, model in
            let cell = collectionView.dequeueReusableCell(with: TextCollectionViewCell.self, for: indexPath)
            cell.setup(with: "\(model)")
            cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .blue
            return cell
        })
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            if kind == UICollectionView.elementKindSectionHeader {
                let header = collectionView.dequeueReusableSectionHeader(with: BasicReusableView.self, for: indexPath)
                header.setup(title: "this is header \(indexPath)")
                header.backgroundColor = .purple
                return header
            } else {
                let footer = collectionView.dequeueReusableSectionHeader(with: BasicReusableView.self, for: indexPath)
                footer.setup(title: "this is footer \(indexPath)")
                footer.backgroundColor = .green
                return footer
            }
        }
    }
    
    func setupSnapshot() -> NSDiffableDataSourceSnapshot<Int, Int> {
        let snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        let arr = Array(0..<5)
        snapshot.appendSections(arr)
        for aaa in arr {
            snapshot.appendItems(Array(0..<10).map { $0 + (aaa + 1) * 30 }, toSection: aaa)
        }
        return snapshot
    }
    
    func updateUI() {
        dataSource.apply(self.setupSnapshot())
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 50
        return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ in
            let item = CVLayout.item(width: .fractionalWidth(1), height: .absolute(150))
            let group = CVLayout.group(type: .horizontal, width: .fractionalWidth(0.8), height: .absolute(160), subitem: item, count: 2)
            group.interItemSpacing = .fixed(8)
            print(group.visualDescription())
            let section = CVLayout.section(group: group)
            let header = CVLayout.header(width: .fractionalWidth(1), height: .absolute(60))
            header.pinToVisibleBounds = sectionIndex % 2 == 0
            let footer = CVLayout.footer(width: .fractionalWidth(0.6), height: .absolute(60))
            footer.pinToVisibleBounds = sectionIndex % 2 == 0
            section.boundarySupplementaryItems = [header, footer]
            section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
            section.orthogonalScrollingBehavior = .groupPagingCentered
            section.interGroupSpacing = 8
            return section
        }, configuration: config)
    }
}
