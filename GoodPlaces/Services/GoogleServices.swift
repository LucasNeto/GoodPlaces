//
//  GoogleServices.swift
//  GoodPlaces
//
//  Created by Lucas  N Santana on 30/11/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
//import GooglePlaces
import Alamofire

protocol GoogleServicesProtocol: BaseServiceProtocol {
    func nearbysearch<T:Codable>(_ request: PlaceRequest, completion: @escaping((T?,ServiceError?)->()))
    func details<T:Codable>(_ request: PlaceDetailRequest, completion: @escaping((T?,ServiceError?)->()))
}
class GoogleServices: BaseService, GoogleServicesProtocol {
    private var appKey                  = "AIzaSyBBWds7P2zchYZzyesJqYyKvq0UJeT9xj8"
    private var baseURL                 = "https://maps.googleapis.com"
    private var nearbysearchFeature     = "/maps/api/place/nearbysearch/json"
    private var detailsFeature          = "/maps/api/place/details/json"
    private var fieldsDetail            = "opening_hours,formatted_phone_number,website,review"
    
    //MARK: GoogleServicesProtocol
    func nearbysearch<T:Codable>( _ request: PlaceRequest, completion: @escaping((T?,ServiceError?)->())){
        guard let url: URL = getUrl("\(nearbysearchFeature)?location=\(request.lat),\(request.lng)&radius=\(request.radius)&type=\(request.type)") else {
            completion(nil,ServiceError("It`s impossible using this URL."))
            return
        }
        doRequest(url, completion: completion)
    }
    func details<T:Codable>(_ request: PlaceDetailRequest, completion: @escaping((T?,ServiceError?)->())) {
        guard let url: URL = getUrl("\(detailsFeature)?place_id=\(request.placeID)&fields=\(fieldsDetail)") else {
            completion(nil,ServiceError("It`s impossible using this URL."))
            return
        }
        doRequest(url, completion: completion)
    }
    
    //MARK: Help URL
    private func getUrl(_ query: String) -> URL? {
        return URL(string: "\(baseURL)\(query)&key=\(appKey)")
    }
    
}
