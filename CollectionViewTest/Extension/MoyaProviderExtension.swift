//
//  MoyaProviderExtension.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import Foundation
import Moya
import Alamofire

public extension MoyaProvider {
    
    final class var `default`: MoyaProvider {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 10
        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.startRequestsImmediately = false
        return MoyaProvider<Target>(callbackQueue: .global(), manager: manager)
    }
}
