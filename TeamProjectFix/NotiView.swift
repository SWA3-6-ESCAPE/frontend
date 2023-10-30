////
////  NotiView.swift
////  TeamProjectFix
////
////  Created by CNU on 2023/10/18.
////
//
//import UserNotifications
//
//func showNotificationIfNeeded(userLocation: CLLocationCoordinate2D) {
//    let placesWithin1Km = places.filter { place in
//        let location = CLLocation(latitude: place.location.latitude, longitude: place.location.longitude)
//        let userLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
//        return location.distance(from: userLocation) < 1000
//    }
//
//    if !placesWithin1Km.isEmpty {
//        // 알림 내용 생성
//        let content = UNMutableNotificationContent()
//        content.title = "사건 알림"
//        content.body = "1km 이내에 사건이 생겼어요. 조심하세요!"
//        content.sound = UNNotificationSound.default
//
//        // 알림 요청 생성
//        let request = UNNotificationRequest(identifier: "eventNotification", content: content, trigger: nil)
//
//        // 알림을 등록
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("알림 등록 중 오류 발생: \(error)")
//            } else {
//                print("알림이 성공적으로 등록되었습니다.")
//            }
//        }
//    }
//}
