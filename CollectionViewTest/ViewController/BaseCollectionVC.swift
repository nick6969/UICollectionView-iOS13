//
//  BaseCollectionVC.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit

class BaseCollectionVC<SectionModelType, CellModelType>: UIViewController where SectionModelType: Hashable, CellModelType: Hashable {
    
    private
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    var dataSource: UICollectionViewDiffableDataSource<SectionModelType, CellModelType>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerForCollectionView(collectionView: collectionView)
        setupDataSource()
        updateUI()
    }
    
    private
    func setupUI() {
        view.addSubview(collectionView)
        collectionView.mLaySafe(pin: .allZero)
    }
    
    func updateUI() {
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private
    func setupDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: getCellProvider())
        dataSource.supplementaryViewProvider = getSupplementaryViewProvider()
    }
    
    private
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<SectionModelType, CellModelType> {
        var snapost = NSDiffableDataSourceSnapshot<SectionModelType, CellModelType>()
        let sectionIdentifiters = getDataSectionIdentifiters()
        snapost.appendSections(sectionIdentifiters)
        for identifiter in sectionIdentifiters {
            snapost.appendItems(getDataModels(with: identifiter), toSection: identifiter)
        }
        return snapost
    }
    
    /// Can override this method get layout to register decorationView
    func generateLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(sectionProvider: getSectionProvider())
    }
    
    /// Can override this method to register cell / header / footer to collectionView
    func registerForCollectionView(collectionView: UICollectionView) { }
    
    /// Can override this method to setup section layout
    func getSectionProvider() -> UICollectionViewCompositionalLayoutSectionProvider {
        return { _, _ in return nil }
    }
    
    /// Can override this method to setup supplementaryView
    func getSupplementaryViewProvider() -> ((UICollectionView, String, IndexPath) -> UICollectionReusableView?)? {
        return nil
    }
    
    /// Can override this method to setup cell
    func getCellProvider() -> (UICollectionView, IndexPath, CellModelType) -> UICollectionViewCell? {
        return { _, _, _ in return nil }
    }
    
    /// Can override this method to set how many section in collectionView
    func getDataSectionIdentifiters() -> [SectionModelType] {
        return []
    }
    
    /// Can Override this method to set how many items in the section
    func getDataModels(with section: SectionModelType) -> [CellModelType] {
        return []
    }
}
