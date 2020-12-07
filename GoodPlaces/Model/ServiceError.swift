//
//  ServiceError.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

class ServiceError: Error {
    var message: String?
    init(_ message: String? = nil){
        self.message = message
    }
    func getMessage() -> String {
        return message ?? "We are not Working, can you try again late?"
    }
}
