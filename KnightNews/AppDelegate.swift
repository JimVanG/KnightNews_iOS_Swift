//
//  AppDelegate.swift
//  KnightNews
//
//  Created by james van gaasbeck on 12/22/14.
//  Copyright (c) 2014 james van gaasbeck. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)
        
        UISegmentedControl.appearance().tintColor = self.UIColorFromRGB(0xCFB53B)
        
        UIToolbar.appearance().tintColor = self.UIColorFromRGB(0xCFB53B)
        UIToolbar.appearance().barTintColor = UIColor.blackColor()
        
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        UINavigationBar.appearance().tintColor = self.UIColorFromRGB(0xCFB53B)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: self.UIColorFromRGB(0xCFB53B), UIFont(name: "HelveticaNeue-CondensedBlack", size: 21.0)!: NSFontAttributeName]
        
        UITabBar.appearance().tintColor = self.UIColorFromRGB(0xCFB53B)
        UITabBar.appearance().backgroundImage = self.imageWithColor(UIColor.blackColor(), withSize: CGSizeMake(320, 50))
        
        self.window?.backgroundColor = UIColor.whiteColor()
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    func imageWithColor(tintColor: UIColor, withSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(withSize)
        
        let context = UIGraphicsGetCurrentContext() as CGContextRef
        CGContextTranslateCTM(context, 0, withSize.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        let rect = CGRectMake(0, 0, withSize.width, withSize.height) as CGRect
        CGContextClipToRect(context, rect)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

