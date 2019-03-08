//
//  ReviewTVC.swift
//  Meeps
//
//  Created by Sagar on 05/03/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class ReviewTVC: UITableViewCell {
    
    //------------------------------------------------------------------------------
    // MARK:- Outlets
    //------------------------------------------------------------------------------
    
    @IBOutlet weak var imgProfile               : UIImageView!
    @IBOutlet weak var lblName                  : UILabel!
//    @IBOutlet weak var ratingView               : CosmosView!
    @IBOutlet weak var lblDescription           : UILabel!
    
    
    //------------------------------------------------------------------------------
    // MARK:- Abstract Method
    //------------------------------------------------------------------------------
    
    class func Nib() -> UINib {
        return UINib(nibName: "ReviewTVC", bundle: nil)
    }
    
    
    //------------------------------------------------------------------------------
    // MARK:- Custom Methods
    //------------------------------------------------------------------------------
    
    func setup() {
        
        self.imgProfile.image = #imageLiteral(resourceName: "icon_profile_placeholder")
//        self.lblName.text = nil
//        self.ratingView.rating = 0.0
//        self.lblDescription.text = nil
        
//        self.ratingView.settings.updateOnTouch = false
        
        
    }
    
    
    //------------------------------------------------------------------------------
    // MARK:- View Loading Methods
    //------------------------------------------------------------------------------
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
