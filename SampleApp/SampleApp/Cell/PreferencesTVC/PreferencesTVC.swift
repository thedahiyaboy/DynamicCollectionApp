//
//  PreferencesTVC.swift
//  Meeps
//
//  Created by Sagar on 07/03/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class PreferencesTVC: UITableViewCell {
    
    @IBOutlet weak var lblTypeName                  : UILabel!
    @IBOutlet weak var cvPreferences                : UICollectionView!
    
    // MARK:- Constraint's Outlets
    @IBOutlet weak var const_cvPreferences_height   : NSLayoutConstraint!
    
    
    //------------------------------------------------------------------------------
    // MARK:- Abstract Method
    //------------------------------------------------------------------------------
    
    class func Nib() -> UINib {
        return UINib(nibName: "PreferencesTVC", bundle: nil)
    }
    
    
    //------------------------------------------------------------------------------
    // MARK:- Custom Methods
    //------------------------------------------------------------------------------
    
    func setCollectionView(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        self.cvPreferences.delegate = dataSourceDelegate
        self.cvPreferences.dataSource = dataSourceDelegate
        self.cvPreferences.tag = row
        self.cvPreferences.reloadData()
    }

    
    //------------------------------------------------------------------------------
    // MARK:- View Loading Methods
    //------------------------------------------------------------------------------
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


