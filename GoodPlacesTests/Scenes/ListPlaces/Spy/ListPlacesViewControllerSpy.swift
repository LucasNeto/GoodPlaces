//
//  ListPlacesViewControllerSpy.swift
//  GoodPlacesTests
//
//  Created by Lucas  N Santana on 06/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
import UIKit
@testable import GoodPlaces

class ListPlacesViewControllerSpy : ListPlacesDisplayLogic {
    
    var activityIndicator: UIActivityIndicatorView? = UIActivityIndicatorView()
    
    var displayPlacesCalled = false
    var displayDetailCalled = false
    var displayAlertCalled = false
    var displayLoadingCalled = false
    var hideLoadingCalled = false
    
    func displayPlaces(viewModel: ListPlaces.List.ViewModel) {
        self.displayPlacesCalled = true
    }
    func displayDetail() {
        self.displayDetailCalled = true
    }
    func displayAlert(viewModel: AlertViewModel) {
        self.displayAlertCalled = true
    }
    func displayLoading() {
        self.displayLoadingCalled = true
    }
    func hideLoading() {
        self.hideLoadingCalled = true
    }
}
