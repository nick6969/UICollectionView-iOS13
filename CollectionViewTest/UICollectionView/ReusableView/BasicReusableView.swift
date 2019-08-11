//
//  BasicReusableView.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit

final class BasicReusableView: UICollectionReusableView {
    
    private let headerLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private
    func setupUI() {
        addSubview(headerLabel)
        headerLabel.mLay(pin: .init(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    func setup(title: String) {
        headerLabel.text = title
    }
}
