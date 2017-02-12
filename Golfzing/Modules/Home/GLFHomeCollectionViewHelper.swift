//
//  GLFHomeCollectionViewHelper.swift
//  Golfzing
//
//  Created by Demo Login on 12/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit

protocol GLFCollectionViewDelegate
{
    func didSelectGolfCourse(golfCourseDomain : GLFGolfCourseDomain)
}

class GLFHomeCollectionViewHelper: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate
{
    var homeDomain : GLFHomeDomain
    var delegate : GLFCollectionViewDelegate
    
    init(helperDelegate : GLFCollectionViewDelegate,homeDomainObject : GLFHomeDomain)
    {
        delegate = helperDelegate
        homeDomain = homeDomainObject
        
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 263, height: 145)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return homeDomain.golfCoursesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GLFGolfCourseDetailsCell
        {
            let golfCourseDomain = homeDomain.golfCoursesArray[indexPath.row]
            cell.loadGolfCourseDetails(golfCourseDomain: golfCourseDomain)
            
            return cell
        }
        
        return collectionView .dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let golfCourseDomain = homeDomain.golfCoursesArray[indexPath.row]
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        delegate.didSelectGolfCourse(golfCourseDomain: golfCourseDomain)
    }
}
