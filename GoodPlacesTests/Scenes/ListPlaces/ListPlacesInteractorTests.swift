//
//  ListPlacesInteractorTests.swift
//  GoodPlacesTests
//
//  Created by Lucas  N Santana on 06/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import GoodPlaces

class ListPlacesInteractorTests: XCTestCase {

    var sut: ListPlacesInteractor!
    var spy: ListPlacesPresenterSpy!
    var worker: ListPlacesWorkerMock!
    
    override func setUp() {
        spy = ListPlacesPresenterSpy()
        worker = ListPlacesWorkerMock()
        sut = ListPlacesInteractor(worker)
        sut.presenter = spy
    }

    override func tearDown() {
        sut = nil
        spy = nil
        worker = nil
    }
    func testGetPlaces(){
        //Given
        worker.shouldReturnSuccess = true
        sut = ListPlacesInteractor(worker)
        sut.presenter = spy
        //When
        sut.getPlaces()
        
        //Then
        XCTAssert(spy.presentLoadingCalled, "Presenter method presentLoading should be called")
        XCTAssert(worker.getPlacesCalled, "Worker method getPlaces should be called")
        XCTAssert(spy.hideLoadingCalled, "Presenter method hideLoading should be called")
        XCTAssert(spy.presentPlacesCalled, "Presenter method presentPlaces should be called")
    }
    
    func testGetPlacesWithFailure(){
        //Given
        worker.shouldReturnSuccess = false
        sut = ListPlacesInteractor(worker)
        sut.presenter = spy
        //When
        sut.getPlaces()
        
        //Then
        XCTAssert(spy.presentLoadingCalled, "Presenter method presentLoading should be called")
        XCTAssert(worker.getPlacesCalled, "Worker method getPlaces should be called")
        XCTAssert(spy.hideLoadingCalled, "Presenter method hideLoading should be called")
        XCTAssert(spy.presentErrorCalled, "Presenter method presentError should be called")
    }
    
    func testSelect(){
        //Given
        sut.getPlaces()
        
        //When
        sut.select(index: 0)
        
        //Then
        XCTAssert(spy.presentDetailCalled, "Presenter method presentDetail should be called")
    }
    
    func testSortByName(){
        //Given
        sut.getPlaces()
        let type : PlaceSortEnum = .name
        
        //When
        sut.sort(by: type)
        let name1 = spy.response?.places.first?.name ?? ""
        let name2 = spy.response?.places.last?.name ?? ""
        
        //Then
        XCTAssert(spy.presentPlacesCalled, "Presenter method presentPlaces should be called")
        XCTAssert(name1 < name2, "Presenter should show sort by name")
        
    }
    func testSortByDistance(){
        //Given
        sut.getPlaces()
        let type : PlaceSortEnum = .distance
        
        //When
        sut.sort(by: type)
        let distance1 = spy.response?.places.first?.distance ?? 0.0
        let distance2 = spy.response?.places.last?.distance ?? 0.0
        
        
        //Then
        XCTAssert(spy.presentPlacesCalled, "Presenter method presentPlaces should be called")
        XCTAssert(distance1 < distance2, "Presenter should show sort by distance")
    }
    func testSortByOpened(){
        //Given
        sut.getPlaces()
        let type : PlaceSortEnum = .opened
        
        //When
        sut.sort(by: type)
        let openNow1 = spy.response?.places.first?.opening?.openNow ?? false
        let openNow2 = spy.response?.places.last?.opening?.openNow ?? false
        
        //Then
        XCTAssert(spy.presentPlacesCalled, "Presenter method presentPlaces should be called")
        XCTAssert(openNow1, "Presenter should show first place openned")
        XCTAssertFalse(openNow2, "Presenter should show last place closed")
    }
}
