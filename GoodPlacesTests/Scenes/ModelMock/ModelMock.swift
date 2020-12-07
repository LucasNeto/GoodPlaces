//
//  ModelMock.swift
//  GoodPlacesTests
//
//  Created by Lucas  N Santana on 06/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

@testable import GoodPlaces

class ModelMock {
    static var listViewModel = ListPlaces.List.ViewModel(itens: [ListPlaces.List.ListPlaceViewModel(name: "Nome Teste 1", openNow: "", rating: "", distance: "")])
    static var places: [Place] = [
        place1,
        place2
    ]
    static var place1: Place = Place(placeID: "", name: "name 1", geometry: geometry, address: "", rating: 2.0, types: [], icon: "", opening: Opening(openNow: true, weekdayText: []), phoneNumber: "", distance: 10.0, reviews: [], website: "")
    static var place2: Place = Place(placeID: "", name: "a name 2", geometry: geometry, address: "", rating: 5.0, types: [], icon: "", opening: Opening(openNow: false, weekdayText: []), phoneNumber: "", distance: 20.0, reviews: [], website: "")
    private static var geometry = Geometry(location: Location(lat: 10.0, lng: 10.0))
}
