//
//  SignupFirstStepVC.swift
//  Meeps
//
//  Created by Sagar on 06/03/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class SignupFirstStepVC: UIViewController {

    
    //------------------------------------------------------------------------------
    // MARK:- Custom Methods
    //------------------------------------------------------------------------------
    
    func setupView() {
        
    }
    
    
    //------------------------------------------------------------------------------
    // MARK:- View Life Cycle Methods
    //------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
}


//------------------------------------------------------------------------------
// MARK:- Extension - UICollectionViewDataSource Methods
//------------------------------------------------------------------------------

extension SignupFirstStepVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    //------------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCategoryCVC", for: indexPath) as! MainCategoryCVC
        
        cell.viewCategory.layer.cornerRadius = 20
        cell.btnSelection.setCornerRadius(radius: cell.btnSelection.frame.size.height / 2)
        
        cell.lblCategoryName.text = "Category \(indexPath.row)"
        
        return cell
    }
}


//------------------------------------------------------------------------------
// MARK:- Extension - UICollectionViewDelegate Methods
//------------------------------------------------------------------------------

extension SignupFirstStepVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


//------------------------------------------------------------------------------
// MARK:- Extension - UICollectionViewDelegateFlowLayout Methods
//------------------------------------------------------------------------------

extension SignupFirstStepVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.size.width - 20) / 3
        return CGSize(width: width, height: width)
    }
}
