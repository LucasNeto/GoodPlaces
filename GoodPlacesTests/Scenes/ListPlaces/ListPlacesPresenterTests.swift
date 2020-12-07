//
//  ListPlacesPresenterTests.swift
//  GoodPlacesTests
//
//  Created by Lucas  N Santana on 06/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import GoodPlaces

class ListPlacesPresenterTests: XCTestCase {

    var sut: ListPlacesPresenter!
    var spy: ListPlacesViewControllerSpy!
    
    override func setUp() {
        spy = ListPlacesViewControllerSpy()
        sut = ListPlacesPresenter()
        sut.viewController = spy
    }

    override func tearDown() {
        sut = nil
        spy = nil
    }
//    func presentLoading()
//    func hideLoading()
    func testPresentPlaces(){
        //Given
        let response = ListPlaces.List.Response(places: ModelMock.places)
        
        //When
        sut.presentPlaces(response: response)
        
        //Then
        XCTAssert(spy.displayPlacesCalled, "Presenter method displayPlaces should be called")
    }
    func testPresentPlacesEmpty(){
        //Given
        let response = ListPlaces.List.Response(places: [])
        
        //When
        sut.presentPlaces(response: response)
        
        //Then
        XCTAssert(spy.displayAlertCalled, "Presenter method displayAlert should be called")
        XCTAssertFalse(spy.displayPlacesCalled, "Presenter method displayPlaces should not be called")
    }
    func testPresentError(){
        //Given
        let error = ServiceError()
        
        //When
        sut.presentError(error: error)
        
        //Then
        XCTAssert(spy.displayAlertCalled, "Presenter method displayAlert should be called")
    }
    func testPresentDetail(){
        //Given
        //When
        sut.presentDetail()
        
        //Then
        XCTAssert(spy.displayDetailCalled, "Presenter method displayDetail should be called")
    }
    func testHideLoading() {
        //Given
        //When
        sut.hideLoading()
        
        //Then
        XCTAssert(spy.hideLoadingCalled, "Presenter method hideLoading should be called")
    }
}
