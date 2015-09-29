//
//  AppDelegate.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import Venmo_iOS_SDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Venmo.startWithAppId("2961", secret: "cjWsEdd3A9gxbTEHgTZBNMnmEx5yzMSt", name: "PlayToPay")
        
        if Venmo.isVenmoAppInstalled() {
            Venmo.sharedInstance().defaultTransactionMethod = VENTransactionMethod.AppSwitch
        } else {
            Venmo.sharedInstance().defaultTransactionMethod = VENTransactionMethod.API
        }
        
        return true
    }
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        if Venmo.sharedInstance().handleOpenURL(url) {
            return true
        }
        // Add app-specific URL handling code here if needed
        return false
    }

}

