//
//  GLFManager.swift
//  Golfzing
//
//  Created by Demo Login on 10/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit
import ObjectMapper

class GLFManager: NSObject
{
    static func loadGLFHomeDomain() -> GLFHomeDomain?
    {
        if let mockDataDict =  GLFUtils.loadFile(fileName: "GLFMockData")
        {
            let homeDomain = GLFHomeDomain(JSON: mockDataDict)
            return homeDomain
        }
        
        return nil
    }
}
