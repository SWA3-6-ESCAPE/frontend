//
//  MyLocationManager.swift
//  TeamProjectFix
//
//  Created by jin ho Jeon on 2023/10/30.
//

import Foundation
import CoreLocation

class MyLocationManager: NSObject, CLLocationManagerDelegate { // 2
    var locationManager: CLLocationManager!
    var lastLocation: CLLocation?
    
    override init() {
        super.init()
        
        self.locationManager = CLLocationManager() // 3
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func postData(category1: Bool) -> Int {
        guard let location = self.locationManager.location else {
            print("Location data is not available")
            return -1
        }
        print("Hello?")
        let semaphore = DispatchSemaphore(value: 0)
        
        
        let latitude: Double = location.coordinate.latitude
        let longitude: Double = location.coordinate.longitude
        // Do something with latitude and longitude\
        let json: [String: Any] = [
            "latitude": latitude,
            "longitude": longitude,
            "category1": category1
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: "http://193.122.103.176/api/report")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        var id : Any = ""
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                if let reportid = responseJSON["reportId"]{
                    id = reportid
                } else {
                    print("no report_id")
                }
            }
            semaphore.signal();
        }
        task.resume()
        semaphore.wait()
        
        if let idAsInt = id as? Int {
            return idAsInt
        } else {
            print("Failed to cast id to Int")
            return -1
        }
        // postData : report create (well-defined) ->
        // me : data <- detail <-> me has report <-
        // event - report connection -> cnt +=1
        
    }
}
