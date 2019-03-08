//
//  SubCategoryCVC.swift
//  Meeps
//
//  Created by Sagar on 07/03/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class SubCategoryCVC: UICollectionViewCell {
    
    //------------------------------------------------------------------------------
    // MARK:- Outlets
    //------------------------------------------------------------------------------
    
    @IBOutlet weak var btnSelection         : UIButton!
    @IBOutlet weak var lblSubCategoryName   : UILabel!
    
    
    //------------------------------------------------------------------------------
    // MARK:- Custom Methods
    //------------------------------------------------------------------------------
    
    func setup() {
        self.contentView.setNeedsLayout()
    }
    
    
    //------------------------------------------------------------------------------
    // MARK:- Abstract Method
    //------------------------------------------------------------------------------
    
    class func Nib() -> UINib {
        return UINib(nibName: "SubCategoryCVC", bundle: nil)
    }
}
