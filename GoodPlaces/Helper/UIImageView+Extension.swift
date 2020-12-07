//
//  UIImageView+Extension.swift
//  GoodPlaces
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
import UIKit

extension UIImageView {
    func loadImageFrom(url: String?){
        guard let imageUrl = url, let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                return
            }
            guard let data = data else { return }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data)
                self.image = image
            })
        }).resume()
    }
}
