//
//  TextCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit

final class TextCollectionViewCell: UICollectionViewCell {
    
    private let textLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private
    func setupUI() {
        contentView.addSubview(textLabel)
        textLabel.mLay(pin: .zero)
    }
    
    func setup(with title: String) {
        textLabel.text = title
    }
    
}
