//
//  ThirdView.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/09/26.
//

import SwiftUI
import MapKit
import CoreLocation
import UserNotifications

struct Report: Codable {
    let reportId: Int
    let category1: Bool
    let category2: String?
    let detail: String?
    let latitude: Double?
    let longitude: Double?
    let created_time: String
}

struct Place : Identifiable {
    var id: UUID=UUID()
    var location : CLLocationCoordinate2D
    
}

struct ThirdView: View {
    @State private var reports: [Report] = []
    
    @State private var centerCoordinate = CLLocationCoordinate2D(latitude: 36.369023, longitude: 127.346090)
    
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.369023, longitude: 127.346090),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    @State private var places: [Place] = [] // 빈 배열로 초기화

    var body: some View {
        // 지도 뷰 생성
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: places) { place in
            MapMarker(coordinate: place.location, tint: .blue)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
        // 사용자의 GPS 위치를 가져오기 위해 CLLocationManager를 생성
        let locationManager = CLLocationManager()
        locationManager.delegate = AppDelegate.shared.locationDelegate
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        }
        .onReceive(AppDelegate.shared.locationDelegate.$userLocation, perform: { userLocation in
            if let userLocation = userLocation {
                centerCoordinate = userLocation.coordinate
                region.center = centerCoordinate
                
                // 거리 측정을 위해 1km를 미터로 변환
                let oneKilometerInMeters: CLLocationDistance = 1000
                
                for place in places {
                    let placeLocation = CLLocation(latitude: place.location.latitude, longitude: place.location.longitude)
                    let distance = userLocation.distance(from: placeLocation)
                    
                    if distance <= oneKilometerInMeters {
                        // 1km 이내에 사건이 있는 경우
                        print("1km 이내에 사건이 생겼어요. 조심하세요!")
                        // 여기에서 알림을 표시하도록 구현
                    } else {
                        // 1km 이외로 벗어난 경우
                        print("사건으로부터 1km 밖으로 벗어났어요")
                        // 여기에서 알림을 표시하도록 구현
                    }
                }
            }
        })
        
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "http://193.122.103.176/api/report") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let reports = try decoder.decode([Report].self, from: data) // JSON 배열 디코딩
                        
                        DispatchQueue.main.async {
                            self.reports = reports
                            
                            places = reports.compactMap { report in
                                if let latitude = report.latitude, let longitude = report.longitude {
//                                    print("Latitude: \(latitude)")
//                                    print("Longitude: \(longitude)")
                                        
                                    return Place(location: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                                }
                                    
                                    return nil
                                }
                        }
                    }
                    catch {
                        print("not decoding")
                    }
                }
            } else {
                print("HTTP Status Code: \(response?.description ?? "Unknown")")
            }
        }.resume()
    }
    
    func showNotificationIfNeeded(userLocation: CLLocationCoordinate2D) {
        let placesWithin1Km = places.filter { place in
            let location = CLLocation(latitude: place.location.latitude, longitude: place.location.longitude)
            let userLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
            return location.distance(from: userLocation) < 1000
        }

        if !placesWithin1Km.isEmpty {
            // 알림 내용 생성
            let content = UNMutableNotificationContent()
            content.title = "사건 알림"
            content.body = "1km 이내에 사건이 생겼어요. 조심하세요!"
            content.sound = UNNotificationSound.default

            // 알림 요청 생성
            let request = UNNotificationRequest(identifier: "eventNotification", content: content, trigger: nil)

            // 알림을 등록
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("알림 등록 중 오류 발생: \(error)")
                } else {
                    print("알림이 성공적으로 등록되었습니다.")
                }
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .environment(\.sizeCategory, .extraExtraLarge)
    }
}


