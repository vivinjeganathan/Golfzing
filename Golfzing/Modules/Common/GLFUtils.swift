//
//  GLFUtils.swift
//  Golfzing
//
//  Created by Demo Login on 10/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit

class GLFUtils: NSObject
{
    static func loadFile(fileName : String) -> Dictionary<String, Any>?
    {
        if let path = Bundle.main.path(forResource: fileName, ofType: "plist")
        {
            if let dictionary = NSDictionary(contentsOfFile: path) as? Dictionary<String, Any>
            {
                return dictionary
            }
        }
        
        return nil
    }
}
