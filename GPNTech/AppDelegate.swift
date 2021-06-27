//
//  AppDelegate.swift
//  GPNTech
//
//  Created by Ivan Kopiev on 26.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notificationManager = NotificationManager.shared


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
//        let target = MainTabBarViewController()
        let auth = AuthViewController()
        let authNavigation = UINavigationController(rootViewController: auth)
        window?.rootViewController = authNavigation
        window?.makeKeyAndVisible()
        
        UNUserNotificationCenter.current().delegate = self
        notificationManager.registerForPushNotification()
        return true
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        completionHandler()
    }
}
