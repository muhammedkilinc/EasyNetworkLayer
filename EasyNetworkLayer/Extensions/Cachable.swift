//
//  Cachable.swift
//  EasyNetworkLayer
//
//  Created by ınomera on 8.11.2018.
//  Copyright © 2018 muhammedkilinc. All rights reserved.
//

import Foundation
import UIKit

//1 Create the protocol
protocol Cachable {}

//2 creating a imageCache private instance
private  let imageCache = NSCache<NSString, UIImage>()

//3 UIImageview conforms to Cachable
extension UIImageView: Cachable {}

//4 creating a protocol extension to add optional function implementations,
extension Cachable where Self: UIImageView {
    
    //5 creating the function
    typealias SuccessCompletion = (Bool) -> ()
    func loadImageUsingCache(url: URL?, placeHolder: UIImage?, completion: @escaping SuccessCompletion) {
        
        self.image = nil
        if let url = url, let cachedImage = imageCache.object(forKey: NSString(string: url.absoluteString)) {
            DispatchQueue.main.async {
                self.image = cachedImage
                completion(true)
            }
            return
        }
        self.image = placeHolder
        
        if let url = url {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                if httpResponse.statusCode == 200 {
                    
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: url.absoluteString))
                            DispatchQueue.main.async {
                                self.image = downloadedImage
                                completion(true)
                            }
                        }
                    }
                } else {
                    self.image = placeHolder
                }
            }).resume()
        } else {
            self.image = placeHolder
        }
    }
}

