//
//  GLFMarkerView.swift
//  Golfzing
//
//  Created by Demo Login on 12/02/17.
//  Copyright © 2017 myCompany. All rights reserved.
//

import UIKit

class GLFMarkerView: UIView
{
    @IBOutlet weak var imageView : UIImageView!
    
    static func getInstance() -> GLFMarkerView
    {
        return (Bundle.main.loadNibNamed("GLFMarkerView", owner: self, options: nil)?[0] as? GLFMarkerView)!
    }
    
    func loadImage(isMarkerSelected : Bool)
    {
        if isMarkerSelected == true
        {
            imageView.image = UIImage(named: "MarkerColoured")
        }
        else
        {
            imageView.image = UIImage(named: "Marker")
        }
    }
}
