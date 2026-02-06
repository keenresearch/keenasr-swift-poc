//
//  AppDelegate.swift
//  kr-sap-poc
//
//  Created by Ognjen Todic on 10/1/17.
//  Copyright © 2017 Keen Research. All rights reserved.
//

import KeenASR
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    KIOSRecognizer.setLogLevel(.debug)

    // here we initialize the SDK with ASR Bundle
    KIOSRecognizer.initWithASRBundle("keenA1m-nnet3chain-en-us")
    
    // arbitrary list of words we will be listening for; this can be changed to any list
    // of commands/phrases, etc.
    let sentences = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
    let recognizer = KIOSRecognizer.sharedInstance()
    
    // now, we create a decoding graph using sentences defined above; decoding graph
    // will be created and stored on the device filesystem and can be referred 
    // to by it's name ('digits'). Note that we can create and  use multiple 
    // decoding graphs (one at the time), if necessary. ViewController will use 
    // this grap to prepare for listening
    KIOSDecodingGraph.createDecodingGraph(fromSentences: sentences, for: recognizer!, andSaveWithName: "digits")
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

