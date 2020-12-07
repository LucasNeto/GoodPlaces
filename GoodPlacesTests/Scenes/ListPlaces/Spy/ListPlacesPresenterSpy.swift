//
//  ListPlacesPresenterSpy.swift
//  GoodPlacesTests
//
//  Created by Lucas  N Santana on 06/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

@testable import GoodPlaces

class ListPlacesPresenterSpy: ListPlacesPresentationLogic {
    
    var presentPlacesCalled = false
    var presentErrorCalled = false
    var presentDetailCalled = false
    var presentLoadingCalled = false
    var hideLoadingCalled = false
    
    var response:ListPlaces.List.Response?
    
    func presentPlaces(response: ListPlaces.List.Response){
        self.presentPlacesCalled = true
        self.response = response
    }
    func presentError(error: Error){
        self.presentErrorCalled = true
    }
    func presentDetail(){
        self.presentDetailCalled = true
    }
    func presentLoading(){
        self.presentLoadingCalled = true
    }
    func hideLoading(){
        self.hideLoadingCalled = true
    }
    
}
