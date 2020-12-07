//
//  BaseService.swift
//  GoodPlaces
//
//  Created by Lucas  N Santana on 30/11/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
import Alamofire
protocol BaseServiceProtocol {
    func doRequest<T:Codable>( _ url: URL, completion: @escaping((T?,ServiceError?)->()))
}
class BaseService: BaseServiceProtocol {
    
    func doRequest<T:Codable>( _ url: URL, completion: @escaping((T?,ServiceError?)->())) {
        Alamofire.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                do{
                    let response : T = try JSONDecoder().decode(T.self, from: data)
                    completion(response,nil)
                }catch{
                    completion(nil,ServiceError(error.localizedDescription))
                }
            case .failure(let error):
                completion(nil,ServiceError(error.localizedDescription))
            }
        }
    }
}
