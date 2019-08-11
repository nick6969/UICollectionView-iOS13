//
//  ContentModel.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import Foundation
import CHLMVP

struct ContentModel<Model>: JsonModel, Hashable where Model: JsonModel, Model: Hashable {
    let title: String
    let data: [Model]
}
