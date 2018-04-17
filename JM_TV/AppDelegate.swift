//
//  AppDelegate.swift
//  JM_TV
//
//  Created by João Marcos on 16/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import AlamofireNetworkActivityIndicator
import AlamofireNetworkActivityLogger
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .info
        NetworkActivityIndicatorManager.shared.isEnabled = true
        NetworkActivityIndicatorManager.shared.startDelay = 0.0
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }

}
