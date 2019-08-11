//
//  MainVC.swift
//  CollectionViewTest
//
//  Created by Nick on 8/5/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit

final class MainVC: UIViewController {
    
    private lazy var buttonClourse: ( (String) -> UIButton) = { [weak self] title in
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle( title, for: .normal)
        guard let self = self else { return button }
        button.addTarget(self, action: #selector(self.didTap(button:)), for: .touchUpInside)
        return button
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(tableViewButton)
        stackView.addArrangedSubview(basicButton)
        return stackView
    }()
    
    private lazy var tableViewButton: UIButton = buttonClourse("fakeTableView")
    private lazy var basicButton: UIButton = buttonClourse("basic collectionview")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private
    func setupUI() {
        view.addSubview(stackView)
        stackView.mLaySafe(pin: .init(top: 40, left: 20, bottom: 40, right: 20))
    }
    
    @objc
    private
    func didTap(button: UIButton) {
        switch button {
        case tableViewButton:
            navigationController?.pushViewController(FakeTableVC(), animated: true)
        case basicButton:
            navigationController?.pushViewController(BasicCollectionVC(), animated: true)
        default:
            break
        }
    }
}
