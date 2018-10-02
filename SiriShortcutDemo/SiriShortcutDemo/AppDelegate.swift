//
//  AppDelegate.swift
//  SiriShortcutDemo
//
//  Created by Haoxin Li on 10/2/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        print("\(#function) \(userActivity.activityType)")
        switch userActivity.activityType {
        case SiriDemoViewController.ActivityType.turnRed.rawValue:
            guard let vc = window?.rootViewController as? SiriDemoViewController else {
                print("\(#function) error: root view controller is not `SiriDemoViewController` as expected")
                return false
            }
            vc.turnRed(self)
            return true
        case SiriDemoViewController.ActivityType.turnWhite.rawValue:
            guard let vc = window?.rootViewController as? SiriDemoViewController else {
                print("\(#function) error: root view controller is not `SiriDemoViewController` as expected")
                return false
            }
            vc.turnWhite(self)
            return true
        default:
            return false
        }
    }
    
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        print("\(#function) \(userActivityType)")
        return true
    }
    
    func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error:
        Error) {
        print("\(#function) \(userActivityType)")
    }
}
