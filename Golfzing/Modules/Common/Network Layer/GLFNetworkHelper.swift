//
//  GLFNetworkHelper.swift
//  Golfzing
//
//  Created by Demo Login on 12/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit

class GLFNetworkHelper: NSObject
{
    static func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void)
    {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    static func downloadImage(url: URL, completionHandler : @escaping (_ image : UIImage?) -> Void )
    {
        getDataFromUrl(url: url) { (data, response, error)  in
            
            guard let data = data, error == nil else
            {
                return
            }
            
            print(response?.suggestedFilename ?? url.lastPathComponent)
            
            DispatchQueue.main.async() { () -> Void in
                
                let image = UIImage(data: data)
                completionHandler(image)
            }
        }
    }
}
