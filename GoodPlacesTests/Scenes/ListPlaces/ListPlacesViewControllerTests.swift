//
//  ListPlacesViewControllerTests.swift
//  GoodPlacesTests
//
//  Created by Lucas  N Santana on 06/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import GoodPlaces

class ListPlacesViewControllerTests: XCTestCase {

    var sut: ListPlacesViewController!
    var spy: ListPlacesInteractorSpy!
    var tableSpy: TableViewSpy!
    var routerSpy: ListPlacesRouterSpy!
    
    override func setUp() {
        tableSpy = TableViewSpy()
        routerSpy = ListPlacesRouterSpy()
        spy = ListPlacesInteractorSpy()
        sut = ListPlacesViewController(style: .plain)
        sut.interactor = spy
        sut.router = routerSpy
        
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        spy = nil
    }
    func testViewDidLoad(){
        XCTAssert(spy.getPlacesCalled, "Interactor method should be called when view did load.")
    }
    func testDisplayPlaces(){
        //Given
        let viewModel = ModelMock.listViewModel
        sut.tableView = tableSpy
        
        //When
        sut.displayPlaces(viewModel: viewModel)
        
        //Then
        XCTAssert(tableSpy.reloadDataCalled, "test")
    }
    func testDisplayDetail(){
        //Given
        
        //When
        sut.displayDetail()
        
        //Then
        XCTAssert(routerSpy.routeToDetailCalled, "Router method routeToDetail should be called.")
    }
    
    func testRefresh(){
        //Given
        let object = NSObject()
        
        //When
        sut.refresh(sender: object)
        
        //Then
        XCTAssert(spy.getPlacesCalled, "Interactor method should be called when view did load.")
    }
    
    func testCellForRowAt(){
        //Given
        sut.displayPlaces(viewModel: ModelMock.listViewModel)
        
        //When
        let cell1 = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ListPlaceTableViewCell
        
        //Then
        //ListPlaceTableViewCell.
        XCTAssertNotNil(cell1, "Cell method should should not return nil.")
        XCTAssertEqual(cell1?.title, ModelMock.listViewModel.itens.first?.name)
    }
    func testDidsaelected(){
        //Given
        sut.displayPlaces(viewModel: ModelMock.listViewModel)
        
        //When
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        //Then
        XCTAssert(spy.selectCalled, "Interactor method select(index:) should be called.")
    }
    func testFilterTapped(){
        sut.filterTapped()
    }
}
class TableViewSpy: UITableView {
    var reloadDataCalled = false
    override func reloadData() {
        reloadDataCalled = true
    }
}

