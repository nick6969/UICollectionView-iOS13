//
//  Api.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import Foundation
import Moya

enum Api {
    case scrollSection
}

extension Api: TargetType {
    var baseURL: URL { return URL(string: "//:")! }
    var path: String { return "" }
    var method: Moya.Method { return .post }
    var sampleData: Data { return Data() }
    var task: Task { return .requestPlain }
    var headers: [String: String]? { return nil }
    var validationType: ValidationType { return .successCodes }
}

extension WebService {
    
    func getScrollSessionData(provider: MoyaProvider<Api> = MoyaProvider<Api>.default,
                              decoder: JSONDecoder = JSONDecoder(),
                              success: ModelSuccessClosure<[TypeModel]>?,
                              failure: ErrorClosure?) {
        
        guard let url = Bundle.main.url(forResource: "ScrollSection", withExtension: "json"),
            let json = try? Data(contentsOf: url) else {
                failure?(MoyaError.statusCode(.init(statusCode: 999, data: Data())))
                return
        }
        
        let customEndpointClosure = { (target: Api) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(200, json) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        let stubbingProvider = MoyaProvider<Api>(endpointClosure: customEndpointClosure,
                                                 stubClosure: MoyaProvider.delayedStub(0.5))

        return request(provider: stubbingProvider,
                       target: .scrollSection,
                       decoder: decoder,
                       success: success,
                       failure: failure)
    }

}
