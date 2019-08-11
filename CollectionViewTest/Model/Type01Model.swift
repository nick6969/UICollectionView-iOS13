//
//  Type01Model.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import Foundation
import CHLMVP

struct Type01Model: JsonModel, Hashable {
    let title: String
    let description: String
    let image: String
    
    private let uuid: UUID = UUID()
}
