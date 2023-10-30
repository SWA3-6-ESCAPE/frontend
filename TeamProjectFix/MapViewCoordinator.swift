//
//  MapViewCoordinator.swift
//  TeamProjectFix
//
//  Created by CNU on 2023/10/23.
//

//import SwiftUI
//import MapKit
//import Combine
//
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate { // MKMapViewDelegate 추가
//    @Published var mapView: MKMapView = MKMapView()
//    @Published var isChanging: Bool = false
//    @Published var currentPlace: String = ""
//    
//    private var manager: CLLocationManager = CLLocationManager()
//    private var currentGeoPoint: CLLocationCoordinate2D?
//    
//    override init() {
//        super.init()
//        
//        self.configureLocationManager()
//    }
//    
//    func configureLocationManager() {
//        mapView.delegate = self // MKMapViewDelegate를 설정
//        manager.delegate = self
//        
//        let status = manager.authorizationStatus
//        
//        if status == .notDetermined {
//            manager.requestAlwaysAuthorization()
//        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
//            mapView.showsUserLocation = true
//        }
//    }
//    
//    func mapViewFocusChange() {
//        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
//        let region = MKCoordinateRegion(center: self.currentGeoPoint ?? CLLocationCoordinate2D(latitude: 37.394776, longitude: 127.11116), span: span)
//        mapView.setRegion(region, animated: true)
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedAlways || status == .authorizedWhenInUse {
//            guard let location = manager.location else {
//                print("[ERROR] No Location")
//                return
//            }
//            
//            self.currentGeoPoint = location.coordinate
//            self.mapViewFocusChange()
//            self.convertLocationToAddress(location: location)
//        }
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("[SUCCESS] Did Update Locations")
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//    }
//    
//    func convertLocationToAddress(location: CLLocation) {
//        let geocoder = CLGeocoder()
//        
//        geocoder.reverseGeocodeLocation(location) { placemarks, error in
//            if error != nil {
//                return
//            }
//            
//            guard let placemark = placemarks?.first else { return }
//            self.currentPlace = "\(placemark.country ?? "") \(placemark.locality ?? "") \(placemark.name ?? "")"
//        }
//    }
//}
//
//struct MapViewCoordinator: UIViewRepresentable {
//    @ObservedObject var locationManager: LocationManager
//    
//    func makeUIView(context: Context) -> MKMapView {
//        return locationManager.mapView
//    }
//    
//    func updateUIView(_ uiView: MKMapView, context: Context) { }
//}
//
//struct MapViewCoordinator_Previews: PreviewProvider {
//    static var previews: some View {
//        MapViewCoordinator(locationManager: LocationManager())
//    }
//}
