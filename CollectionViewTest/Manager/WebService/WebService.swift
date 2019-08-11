//
//  WebService.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import Moya
import CHLMVP

final class WebService {
    
    typealias ModelSuccessClosure<Model: Codable> = (Model) -> Void
    typealias ErrorClosure = (MoyaError) -> Void
    
    static let shared: WebService = WebService()
    
    private init() { }
    
}

extension WebService {
    
    func request<Target, Model>(provider: MoyaProvider<Target> = MoyaProvider<Target>.default,
                                target: Target,
                                decoder: JSONDecoder = JSONDecoder(),
                                success: ModelSuccessClosure<Model>?,
                                failure: ErrorClosure?) where Model: JsonModel {
        
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    try success?(moyaResponse.data.decodeToModel(type: Model.self, decoder: decoder))
                } catch {
                    failure?(MoyaError.objectMapping(error, moyaResponse))
                }
            case let .failure(error):
                failure?(error)
            }
        }
    }
    
}
