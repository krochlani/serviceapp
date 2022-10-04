//
//  serviceappApp.swift
//  serviceapp
//
//  Created by Kyna Rochlani on 03/10/2022.
//

import SwiftUI
//import FirebaseCore

//class AppDelegate: NSObject, UIApplicationDelegate {
  //func application(_ application: UIApplication,
                   //didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    //FirebaseApp.configure()

    //return true
  //}
//}



@main
struct serviceappApp: App {
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            Splash_Screen()
        }
    }
}


