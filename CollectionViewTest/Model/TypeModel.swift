//
//  TypeModel.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import Foundation
import CHLMVP

enum ModelType: Hashable {
    case type01(Type01Model)
}

enum TypeModel: JsonModel, Hashable {
    
    case type01(ContentModel<Type01Model>)
    case none(UUID)
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    init(from decoder: Decoder) throws {
        let vals = try decoder.container(keyedBy: CodingKeys.self)
        guard let type = try? vals.decode(Int.self, forKey: .type) else {
            self = .none(UUID())
            return
        }
        switch type {
        case 1:
            let container = try decoder.singleValueContainer()
            if let model = try? container.decode(ContentModel<Type01Model>.self) {
                self = .type01(model)
                return
            }

        default:
            break
        }
        
        self = .none(UUID())
    }
    
    func encode(to encoder: Encoder) throws { }

}
