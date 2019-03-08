//
//  SubCategoryTVC.swift
//  Meeps
//
//  Created by Sagar on 07/03/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class SubCategoryTVC: UITableViewCell {
    
    //------------------------------------------------------------------------------
    // MARK:- Outlets
    //------------------------------------------------------------------------------
    
    @IBOutlet weak var categoryView                 : UIView!
    @IBOutlet weak var categoryImageView            : UIView!
    @IBOutlet weak var imgCategory                  : UIImageView!
    @IBOutlet weak var lblCategoryName              : UILabel!
    
    @IBOutlet weak var cvSubcategory                : UICollectionView!
    
    // MARK: Constrains's Outlet
    @IBOutlet weak var const_cvSubcategory_height   : NSLayoutConstraint!

    var parantWidth : CGFloat = 0
    
    class func Nib() -> UINib {
        return UINib(nibName: "SubCategoryTVC", bundle: nil)
    }
    
    // MARK:- Custom Methods
    
    func setCollectionView(forRow row: Int) {
        self.cvSubcategory.delegate = self
        self.cvSubcategory.dataSource = self
        self.cvSubcategory.tag = row
        self.cvSubcategory.isScrollEnabled = false
        self.cvSubcategory.layoutIfNeeded()
        self.cvSubcategory.reloadData()
    }
    
    
}

// MARK:-
// MARK:- Extension - UICollectionViewDataSource Methods


extension SubCategoryTVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionView.tag + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("\n\n")
        print(collectionView.tag)
        print(indexPath.section)
        print("\n\n")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCVC", for: indexPath) as! SubCategoryCVC
//        cell.backgroundColor = UIColor.blue
        cell.btnSelection.setCornerRadius(radius: cell.btnSelection.frame.size.height / 2)
        cell.lblSubCategoryName.text = "SubCategory \(indexPath.row)"
        
        return cell
    }
}

// MARK:-
// MARK:- Extension - UICollectionViewDelegateFlowLayout Methods

extension SubCategoryTVC: UICollectionViewDelegateFlowLayout {
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        self.cvSubcategory.layoutIfNeeded()
        let contentSize = self.cvSubcategory.collectionViewLayout.collectionViewContentSize
        if self.cvSubcategory.numberOfItems(inSection: 0) < 4 {
            return CGSize(width: contentSize.width, height: 114) // Static height if colview is not fitted properly.
        }
        
        return CGSize(width: contentSize.width, height: contentSize.height + 20)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        return CGSize(width: width, height: 30)
    }
}
