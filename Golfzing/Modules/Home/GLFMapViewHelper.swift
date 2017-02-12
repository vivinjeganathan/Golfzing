//
//  GLFMapViewHelper.swift
//  Golfzing
//
//  Created by Demo Login on 12/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit

protocol GLFMapViewHelperDelegate
{
    func userTappedItem(at indexPath : IndexPath)
}

class GLFMapViewHelper: NSObject, GMSMapViewDelegate
{
    var delegate : GLFMapViewHelperDelegate
    var markerDomainArray : [GLFMarkerDomain]
    
    init(helperDelegate : GLFMapViewHelperDelegate, markerDomains : [GLFMarkerDomain])
    {
        delegate = helperDelegate
        markerDomainArray = markerDomains
        
        super.init()
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool
    {
        if let glfMarker = marker as? GLFMarkerDomain
        {
            if let indexPath = glfMarker.golfCourseDomain.indexPath
            {
                delegate.userTappedItem(at: indexPath)
            }
        }
        
        if let selectedMarker = mapView.selectedMarker
        {
            (selectedMarker.iconView as? GLFMarkerView)?.loadImage(isMarkerSelected: false)
        }
        
        mapView.selectedMarker = marker
        (mapView.selectedMarker?.iconView as? GLFMarkerView)?.loadImage(isMarkerSelected: true)
        
        return true
    }
}
