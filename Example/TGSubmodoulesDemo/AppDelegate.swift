//
//  AppDelegate.swift
//  TGSubmodoulesDemo
//
//  Created by apple on 2025/1/4.
//

import UIKit
import TGSubmodoules

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        TestB.printTest()
        TestC.printTest()
        return true
    }

}

