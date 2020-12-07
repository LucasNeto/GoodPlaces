//
//  Place.swift
//  GoodPlaces
//
//  Created by Lucas  N Santana on 30/11/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

struct Place: Codable {
    var placeID: String?
    var name: String?
    var geometry: Geometry?
    var address: String?
    var rating: Float?
    var types: [String]?
    var icon: String?
    var opening: Opening?
    var phoneNumber: String?
    var distance: Float?
    var reviews: [PlaceReview]?
    var website: String?
    
    enum CodingKeys: String, CodingKey {
        case placeID = "place_id"
        case address = "vicinity"
        case opening = "opening_hours"
        case phoneNumber = "formatted_phone_number"
        case name,geometry,rating,types,icon,reviews,website
        
    }
}
