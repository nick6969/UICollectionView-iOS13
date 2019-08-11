//
//  ImageCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    private let detailLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private
    func setupUI() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.black.cgColor
        contentView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        titleLabel.numberOfLines = 2
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.textColor = .darkGray
        detailLabel.numberOfLines = 2
        detailLabel.font = .boldSystemFont(ofSize: 12)
        detailLabel.textColor = .lightGray

        contentView.addSubview(imageView)
        imageView.mLay(.width, .equal, contentView)
        imageView.mLay(.height, .equal, contentView, .width)
        imageView.mLay(.top, .equal, contentView)
        imageView.mLay(.centerX, .equal, contentView)
        
        contentView.addSubview(titleLabel)
        titleLabel.mLay(.top, .equal, imageView, .bottom, constant: 8)
        titleLabel.mLay(.centerX, .equal, contentView)
        titleLabel.mLay(.width, .equal, contentView, constant: -16)
        
        contentView.addSubview(detailLabel)
        detailLabel.mLay(.top, .equal, titleLabel, .bottom, constant: 8)
        detailLabel.mLay(.centerX, .equal, contentView)
        detailLabel.mLay(.width, .equal, contentView, constant: -16)
    }
        
    func setup(with model: Type01Model) {
        imageView.image = UIImage(named: model.image)
        titleLabel.text = model.title
        detailLabel.text = model.description
    }

}
