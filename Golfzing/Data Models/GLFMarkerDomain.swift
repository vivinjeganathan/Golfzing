//
//  GLFMarkerDomain.swift
//  Golfzing
//
//  Created by Demo Login on 10/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit

class GLFMarkerDomain: GMSMarker
{
    var golfCourseDomain: GLFGolfCourseDomain
    
    init(golfCourseDetails: GLFGolfCourseDomain)
    {
        golfCourseDomain = golfCourseDetails
        
        super.init()
        
        let customMarkerView = GLFMarkerView.getInstance()
        customMarkerView.loadImage(isMarkerSelected: false)
        
        iconView = customMarkerView
    
        position = golfCourseDomain.location.getLocationCoordinate2D()
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = kGMSMarkerAnimationPop
    }
}
