//
//  SectionScrollVC.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit
import CHLMVP

final class SectionScrollVC: BaseCollectionVC<TypeModel, ModelType> {
    
    private let presenter: SectionScrollPresenter = SectionScrollPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadDelegate = self
        presenter.nextState()
    }
    
    override func registerForCollectionView(collectionView: UICollectionView) {
        collectionView.registerCell(type: ImageCollectionViewCell.self)
        collectionView.registerSectionHeader(type: BasicReusableView.self)
    }
    
    override func getSectionProvider() -> UICollectionViewCompositionalLayoutSectionProvider {
        return { _, _ in
            let item = CVLayout.item(width: .absolute(100), height: .absolute(160))
            let group = CVLayout.group(type: .horizontal, width: .absolute(100), height: .absolute(170), subitem: item, count: 1)
            let section = CVLayout.section(group: group)
            section.interGroupSpacing = 8
            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
            let header = CVLayout.header(width: .fractionalWidth(1), height: .absolute(50))
            section.boundarySupplementaryItems = [header]
            return section
        }
    }
    
    override func getCellProvider() -> (UICollectionView, IndexPath, ModelType) -> UICollectionViewCell? {
        return { collectionView, indexPath, model in
            guard case let .type01(mmm) = model else { return nil }
            let cell = collectionView.dequeueReusableCell(with: ImageCollectionViewCell.self, for: indexPath)
            cell.setup(with: mmm)
            return cell
        }
    }
    
    override func getSupplementaryViewProvider() -> ((UICollectionView, String, IndexPath) -> UICollectionReusableView?)? {
        return { [weak self] collectionView, kind, indexPath in
            guard let self = self else { return nil }
            guard let contentModel = self.presenter.model(at: indexPath.item) else { return nil }
            guard case let .type01(model) = contentModel else { return nil }
            let header = collectionView.dequeueReusableSectionHeader(with: BasicReusableView.self, for: indexPath)
            header.setup(title: model.title)
            return header
        }
    }
    
    override func getDataSectionIdentifiters() -> [TypeModel] {
        return presenter.models
    }
    
    override func getDataModels(with section: TypeModel) -> [ModelType] {
        guard case let .type01(mmm) = section else { return [] }
        return mmm.data.map { ModelType.type01($0) }
    }
}

extension SectionScrollVC: PresenterLoadDelegate {
    func loadingDone(_ oldCount: Int, _ newCount: Int) {
        updateUI()
    }
    
    func loadingFail(_ error: Error?) {
        print(error as Any)
    }
    
}
