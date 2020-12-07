//
//  ListPlacesWorkerMock.swift
//  GoodPlacesTests
//
//  Created by Lucas  N Santana on 06/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

@testable import GoodPlaces

class ListPlacesWorkerMock : ListPlacesWorkerProtocol {
    var getPlacesCalled = false
    var shouldReturnSuccess = true
    func getPlaces(completion: @escaping (Result<[Place], ServiceError>) -> ()) {
        getPlacesCalled = true
        if shouldReturnSuccess {
            completion(.success(ModelMock.places))
        }else{
            completion(.failure(ServiceError()))
        }
    }
}

