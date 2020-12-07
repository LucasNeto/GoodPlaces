//
//  ListPlacesRouterSpy.swift
//  GoodPlacesTests
//
//  Created by Lucas  N Santana on 06/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
import Foundation
@testable import GoodPlaces

class ListPlacesRouterSpy: NSObject, ListPlacesDataPassing & ListPlacesRoutingLogic {
    var dataStore: ListPlacesDataStore?
    
    
    var routeToDetailCalled = false
    
    func routeToDetail() {
        routeToDetailCalled = true
    }
    
    
}
