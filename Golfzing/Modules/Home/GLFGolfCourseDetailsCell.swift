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
    @IBOutlet weak var ratingsView: UIView!
    @IBOutlet weak var golfzingStarRatedImage: UIImageView!
    
    var golfCourseDomain : GLFGolfCourseDomain!
    
    func loadGolfCourseDetails(golfCourseDomain : GLFGolfCourseDomain)
    {
        self.golfCourseDomain = golfCourseDomain
        
        nameLabel.text = golfCourseDomain.name
        addressLabel.text = golfCourseDomain.address
        spanLabel.text = golfCourseDomain.span
        ratePerHourLabel.text = golfCourseDomain.ratePerHour
        
        golfzingStarRatedImage.isHidden = golfCourseDomain.isGolfzingStarRated == true ? true : false
        
        loadGolfCourseImage()
        addRatingStars()
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
    
    func addRatingStars()
    {
        let numberOfStars = Int(golfCourseDomain.rating)!
        
        for i in 0...(numberOfStars - 1)
        {
            let starImageView = UIImageView(image: UIImage(named: "StarSelected"))
            starImageView.translatesAutoresizingMaskIntoConstraints = false
            ratingsView.addSubview(starImageView)
            
            starImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
            starImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
            
            let leadingSpace = CGFloat(10 * i)
            
            NSLayoutConstraint(item: starImageView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: ratingsView, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: leadingSpace).isActive = true
            
            NSLayoutConstraint(item: starImageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: ratingsView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0).isActive = true
            
            NSLayoutConstraint(item: starImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: ratingsView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0).isActive = true
        }
    }
}
