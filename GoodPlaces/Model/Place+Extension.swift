//
//  Place+Extension.swift
//  GoodPlaces
//
//  Created by Lucas  N Santana on 07/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

struct Opening: Codable {
    var openNow: Bool?
    var weekdayText: [String]?
    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
        case weekdayText = "weekday_text"
    }
}
struct Geometry: Codable {
    var location: Location?
}
struct Location: Codable{
    var lat: Float?
    var lng: Float?
}
struct PlaceReview: Codable {
    var authorName: String?
    var authorPhotoUrl: String?
    var rating: Float?
    var timeDesc: String?
    var textReview: String?
    enum CodingKeys: String, CodingKey {
        case authorName = "author_name"
        case authorPhotoUrl = "author_url"
        case timeDesc = "relative_time_description"
        case textReview = "text"
        case rating
    }
}
