//
//  AppDelegate.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var context: AppContext?
    var window: UIWindow?
    var mainFC: MainFC?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window = window else { return false }
        
        context = PokemonContext();
        
        guard let context = context else { return false }
        
        mainFC = MainFC(window: window, context: context)
                
        // start initial flow
        mainFC?.start()
        
        return true
    }
}

