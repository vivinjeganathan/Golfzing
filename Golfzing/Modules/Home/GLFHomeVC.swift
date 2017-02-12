//
//  GLFHomeVC.swift
//  Golfzing
//
//  Created by Demo Login on 10/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit

class GLFHomeVC: UIViewController, GLFMapViewHelperDelegate, GLFCollectionViewDelegate
{
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var courtsCollectionView : UICollectionView!
    @IBOutlet weak var mapView : GMSMapView!
    @IBOutlet weak var addressTextField : UITextField!
    
    let homeDomain = GLFManager.loadGLFHomeDomain()!
    
    var collectionViewHelper : GLFHomeCollectionViewHelper!
    var mapViewHelper : GLFMapViewHelper!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let markerDomainArray = GLFHomeManager.getMarkerDomains(golfCoursesArray: homeDomain.golfCoursesArray)
        
        collectionViewHelper = GLFHomeCollectionViewHelper(helperDelegate: self, homeDomainObject: homeDomain)
        mapViewHelper = GLFMapViewHelper(helperDelegate: self, markerDomains: markerDomainArray)
        
        mapView.delegate = mapViewHelper
        mapView.isMyLocationEnabled = true
        
        courtsCollectionView.delegate = collectionViewHelper
        courtsCollectionView.dataSource = collectionViewHelper
        
        GLFHomeManager.loadAllMarkersInMap(markerDomainArray: markerDomainArray, mapView: mapView)
        
        modifyPageTitle()
    }
    
    func modifyPageTitle()
    {
        let string = NSMutableAttributedString(string: "GOLFZING")
        let selectedRange = NSRange(location: 4, length: 4)
        
        string.beginEditing()
        string.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 17.0), range: selectedRange)
        string.endEditing()

        titleLabel.attributedText = string
    }
    
    // MARK: - GLF MAPVIEW HELPER DELEGATE METHODS
    func userTappedItem(at indexPath: IndexPath)
    {
        courtsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // MARK: - GLF COLLECTION VIEW HELPER DELEGATE METHODS
    func didSelectGolfCourse(golfCourseDomain: GLFGolfCourseDomain)
    {
        mapViewHelper.changeViewsForSelectedMarker(mapView: mapView, marker: golfCourseDomain.associatedMakerDomain)
    }
}
