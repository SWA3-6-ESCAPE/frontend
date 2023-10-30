//
//  AppDelegate.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/09/26.
//

import Foundation
import UIKit
import CoreLocation

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var shared: AppDelegate!
    
    let locationDelegate = LocationDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.shared = self
        requestNotificationAuthorization()
        return true
    }
    
    func requestNotificationAuthorization() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    print("알림 권한이 허용되었습니다.")
                } else {
                    print("알림 권한이 거부되었습니다.")
                }
            }
        }
    }
}

class LocationDelegate: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var userLocation: CLLocation? = nil

    private var locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            userLocation = location
        }
    }
}



