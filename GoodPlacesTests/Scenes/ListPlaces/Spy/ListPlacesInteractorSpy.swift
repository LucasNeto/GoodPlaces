//
//  ListPlacesInteractorSpy.swift
//  GoodPlacesTests
//
//  Created by Lucas  N Santana on 06/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

@testable import GoodPlaces

class ListPlacesInteractorSpy : ListPlacesBusinessLogic {
    
    var getPlacesCalled = false
    var selectCalled = false
    var sortCalled = false
    
    func getPlaces(){
        getPlacesCalled = true
    }
    func select(index: Int){
        selectCalled = true
    }
    func sort(by: PlaceSortEnum) {
        sortCalled = true
    }
}
