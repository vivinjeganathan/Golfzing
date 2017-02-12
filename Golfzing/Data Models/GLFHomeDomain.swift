//
//  GLFHomeDomain.swift
//  Golfzing
//
//  Created by Demo Login on 10/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit
import ObjectMapper

class GLFHomeDomain: Mappable
{
    var golfCoursesArray : [GLFGolfCourseDomain]!
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        golfCoursesArray   <-   map["GolfCourses"]
    }
}

class GLFGolfCourseDomain: Mappable
{
    var glfCourseID : String!
    var name : String!
    var address : String!
    var span : String!
    var location : GLFLocation!
    var imageURL : String!
    var ratePerHour : String!
    var rating : String!
    var isGolfzingStarRated : Bool!
    
    var indexPath : IndexPath!
    
    //FOR IMAGE
    var imageDownloadInitiated = false
    var image : UIImage?
    
    var associatedMakerDomain : GLFMarkerDomain!
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        glfCourseID         <-      map["id"]
        name                <-      map["name"]
        address             <-      map["address"]
        span                <-      map["span"]
        location            <-      map["location"]
        imageURL            <-      map["imageURL"]
        ratePerHour         <-      map["ratePerHour"]
        rating              <-      map["rating"]
        isGolfzingStarRated <-      map["golfZingStarRated"]
    }
}

class GLFLocation: Mappable
{
    var latitude : String!
    var longitude : String!
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        latitude    <-      map["latitude"]
        longitude   <-      map["longitude"]
    }
    
    func getLocationCoordinate2D() -> CLLocationCoordinate2D
    {
        return CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
    }
}
