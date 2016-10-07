//
//  TagManager.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 07/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit
import Foundation

enum EventCategory: String {
    case ButtonClick
}

enum EventAction: String {
    case login
    case subscribe
    case Button
}

enum EventLabel: String {
    case connection
    case newSubscribe
}

class TagManager: NSObject {
    static private var tracker: GAITracker?
    
    class func configureAnalytics() {
        
        // Configure tracker from GoogleService-Info.plist
        var configureError:NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        let gai = GAI.sharedInstance()
        
        // Optional: configure GAI options.
        gai?.trackUncaughtExceptions = true  // report uncaught exceptions
        
        //   gai.logger.logLevel = GAILogLevel.Verbose  // remove before app release
        
        TagManager.tracker = gai?.tracker(withTrackingId: "UA-56074244-2")
        
    }
    
    
    class func sendEventWithCategory(category: EventCategory? = nil, action: EventAction? = nil, label: EventLabel, value: Int? = nil) {
        TagManager.tracker?.set(kGAIScreenName, value: label.rawValue)
        
        if let categ = category?.rawValue , let act = action?.rawValue  {
            // event
            if let builder = GAIDictionaryBuilder.createEvent(withCategory: categ, action: act, label: label.rawValue, value: value as NSNumber!) {
                TagManager.tracker?.send(builder.build() as [NSObject : AnyObject])
            }
        } else {
            // screen
            if let builder = GAIDictionaryBuilder.createScreenView() {
            TagManager.tracker?.send(builder.build() as [NSObject : AnyObject])
            }
        }
    }

}
