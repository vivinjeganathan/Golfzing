//
//  GLFHomeManager.swift
//  Golfzing
//
//  Created by Demo Login on 10/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit

class GLFHomeManager: NSObject
{
    static func getMarkerDomains(golfCoursesArray : [GLFGolfCourseDomain]) -> [GLFMarkerDomain]
    {
        var markerDomainArray = [GLFMarkerDomain]()
        
        for (index, golfCourseDomain) in golfCoursesArray.enumerated()
        {
            let markerDomain = GLFMarkerDomain(golfCourseDetails: golfCourseDomain)
            
            let indexPath = IndexPath(item: index, section: 0)
            golfCourseDomain.indexPath = indexPath
            
            golfCourseDomain.associatedMakerDomain = markerDomain
            
            markerDomainArray.append(markerDomain)
        }
        
        return markerDomainArray
    }
    
    static func loadAllMarkersInMap(markerDomainArray : [GLFMarkerDomain], mapView : GMSMapView)
    {
        let path = GMSMutablePath()
        
        for markerDomain: GLFMarkerDomain in markerDomainArray
        {
            path.add(markerDomain.position)
            markerDomain.map = mapView
        }
        
        let bounds = GMSCoordinateBounds(path: path)
        mapView.animate(with: GMSCameraUpdate.fit(bounds))
    }
}
