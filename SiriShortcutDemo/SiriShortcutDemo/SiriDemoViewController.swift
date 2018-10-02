//
//  SiriDemoViewController.swift
//  SiriShortcutDemo
//
//  Created by Haoxin Li on 10/2/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

// See tutorial from Appcoda: https://www.appcoda.com/siri-shortcuts/

import UIKit

final class SiriDemoViewController: UIViewController {
    
    enum ActivityType: String {
        case turnRed = "com.haoxinli.SiriShortcutDemo.turnRed"
        case turnWhite = "com.haoxinli.SiriShortcutDemo.turnWhite"
    }
    
    @IBAction func turnRed(_ sender: Any) {
        let activity = ActivityType.turnRed
        view.backgroundColor = activity.color
        donateActivity(activityType: activity)
    }
    
    @IBAction func turnWhite(_ sender: Any) {
        let activity = ActivityType.turnWhite
        view.backgroundColor = activity.color
        donateActivity(activityType: activity)
    }
}

private extension SiriDemoViewController {

    /**
     Apple doc: https://developer.apple.com/documentation/sirikit/donating_shortcuts
     "You should donate a shortcut each time the user performs the action in your app. For example, if the user can order soup from a restaurant using your app, donate a shortcut for the order soup action after the user places their order. Don’t make donations for actions that the user has not completed in your app; if the user never places an order for soup, you should never donate a shortcut for the order soup action."
     */
    func donateActivity(activityType: ActivityType) {
        let activity = activityType.activity
        view.userActivity = activity
        activity.becomeCurrent()
    }
}

private extension SiriDemoViewController.ActivityType {
    
    var color: UIColor {
        switch self {
        case .turnRed:
            return .red
        case .turnWhite:
            return .white
        }
    }
    
    var activity: NSUserActivity {
        let activity = NSUserActivity(activityType: rawValue)
        switch self {
        case .turnRed:
            activity.title = "Make view turn red"
            activity.userInfo = ["color" : "red"]
        case .turnWhite:
            activity.title = "Make view turn white"
            activity.userInfo = ["color" : "white"]
        }
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = rawValue
        return activity
    }
}
