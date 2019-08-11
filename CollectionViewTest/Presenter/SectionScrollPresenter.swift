//
//  SectionScrollPresenter.swift
//  CollectionViewTest
//
//  Created by Nick on 8/11/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import Foundation
import CHLMVP

final class SectionScrollPresenter: BasePresenter<TypeModel>, StandardPresenter {
    func loadData() {
        WebService.shared.getScrollSessionData(success: modelsSuccessClosure,
                                               failure: loadFailClosure)
    }
    
    func loadDataMore() {}
}
