//
//  GLFGolfCourseDetailsCell.swift
//  Golfzing
//
//  Created by Demo Login on 11/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit

class GLFGolfCourseDetailsCell: UICollectionViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var spanLabel: UILabel!
    @IBOutlet weak var ratePerHourLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var golfzingStarRatedImage: UIImageView!
    
    var golfCourseDomain : GLFGolfCourseDomain!
    
    func loadGolfCourseDetails(golfCourseDomain : GLFGolfCourseDomain)
    {
        self.golfCourseDomain = golfCourseDomain
        
        nameLabel.text = golfCourseDomain.name
        addressLabel.text = golfCourseDomain.address
        spanLabel.text = golfCourseDomain.span
        ratePerHourLabel.text = golfCourseDomain.ratePerHour
        
        loadGolfCourseImage()
        
        golfzingStarRatedImage.isHidden = golfCourseDomain.isGolfzingStarRated == true ? true : false
    }
    
    func loadGolfCourseImage()
    {
        if let checkedUrl = URL(string: golfCourseDomain.imageURL)
        {
            if golfCourseDomain.imageDownloadInitiated == false
            {
                golfCourseDomain.imageDownloadInitiated = true
                imageView.contentMode = .scaleAspectFit
                GLFNetworkHelper.downloadImage(url: checkedUrl, completionHandler: { (image) in
                    
                    self.golfCourseDomain.image = image
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                    
                })
            }
            else
            {
                imageView.image = golfCourseDomain.image
            }
        }
    }
    
    func addRatingStars(numberOfStars : Int)
    {
        
    }
}
