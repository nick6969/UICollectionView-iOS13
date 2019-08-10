//
//  AppDelegate.swift
//  CollectionViewTest
//
//  Created by Nick on 8/5/19.
//  Copyright © 2019 app.kcin.nil. All rights reserved.
//

import UIKit
import mLayout

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.rootViewController = UINavigationController(rootViewController: MainVC())
        
        return true
    }

}
