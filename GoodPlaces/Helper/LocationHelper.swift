//
//  LocationHelper.swift
//  GoodPlaces
//
//  Created by Lucas  N Santana on 27/11/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
import CoreLocation

class LocationHelper:NSObject {
    var managerCLL: CLLocationManager!
    override init(){
        super.init()
        managerCLL = CLLocationManager()
    }
    func requestIfNeeded(){
        managerCLL.requestWhenInUseAuthorization()
    }
    
    func getLat() -> String? {
        guard let lat = managerCLL.location?.coordinate.latitude else { return nil }
        return String(describing: lat)
    }
    func getLng() -> String? {
        guard let lng = managerCLL.location?.coordinate.longitude else { return nil }
        return String(describing: lng)
    }
    func getDistanceFromMe(toLat:Float?, toLng: Float?) -> Float? {
        guard let locationTo = getLocation(lat: toLat, lng: toLng) else { return nil }
        guard let distance = managerCLL.location?.distance(from: locationTo) else { return nil }
        return Float(distance)/1000
    }
    private func getLocation(lat: Float?, lng: Float?) -> CLLocation? {
        guard let latitude = lat,
            let longitude = lng,
        let latD = CLLocationDegrees(exactly: latitude),
        let lngD = CLLocationDegrees(exactly: longitude) else { return nil }
        return CLLocation(latitude: latD, longitude: lngD)
    }
}
