//
//  AppDelegate.swift
//  HistoriaInterativa
//
//  Created by Natalia da Rosa on 25/07/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let telaPrincipal = TelaInicialViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = telaPrincipal
        window?.makeKeyAndVisible()
        
        return true
    }

}

