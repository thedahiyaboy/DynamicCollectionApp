//
//  SignupThirdStepVC.swift
//  Meeps
//
//  Created by Sagar on 06/03/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class SignupThirdStepVC: UIViewController {

    //------------------------------------------------------------------------------
    // MARK:- Outlets
    //------------------------------------------------------------------------------
    
    @IBOutlet weak var labelPreferences             : UILabel!
    @IBOutlet weak var tblPreferences               : UITableView!
    
    //------------------------------------------------------------------------------
    // MARK:- Custom Methods
    //------------------------------------------------------------------------------
    
    func setupView() {
        self.tblPreferences.register(PreferencesTVC.Nib(), forCellReuseIdentifier: "PreferencesTVC")
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
// MARK:- Extension - UITableViewDataSource Methods
//------------------------------------------------------------------------------

extension SignupThirdStepVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreferencesTVC", for: indexPath) as! PreferencesTVC
        
        cell.lblTypeName.text = "Type \(indexPath.row)"
        cell.frame = tableView.bounds
        
        cell.cvPreferences.register(SubCategoryCVC.Nib(), forCellWithReuseIdentifier: "SubCategoryCVC")
        
        return cell
    }
    
    //------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Category \(section)"
    }
}


//------------------------------------------------------------------------------
// MARK:- Extension - UITableViewDelegate Methods
//------------------------------------------------------------------------------

extension SignupThirdStepVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let preferencesCell = cell as? PreferencesTVC else { return }
        
        let tag = Int("\(indexPath.section)\(indexPath.row)")!
        
        preferencesCell.setCollectionView(dataSourceDelegate: self, forRow: tag)
        
        preferencesCell.cvPreferences.setNeedsLayout()
        preferencesCell.layoutIfNeeded()
        
        preferencesCell.const_cvPreferences_height.constant = preferencesCell.cvPreferences.contentSize.height
        
        preferencesCell.cvPreferences.setNeedsLayout()
        preferencesCell.layoutIfNeeded()
        preferencesCell.contentView.layoutIfNeeded()
    }
    
    //------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.backgroundView?.backgroundColor = .orange
    }
    
    //------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    //------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    //------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


//------------------------------------------------------------------------------
// MARK:-
// MARK:- Extension - UICollectionViewDataSource Methods
//------------------------------------------------------------------------------

extension SignupThirdStepVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //------------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCVC", for: indexPath) as! SubCategoryCVC
        
        cell.btnSelection.setCornerRadius(radius: cell.btnSelection.frame.size.height / 2)
        cell.lblSubCategoryName.text = "Preference \(indexPath.row)"
        
        return cell
    }
}


//------------------------------------------------------------------------------
// MARK:-
// MARK:- Extension - UICollectionViewDelegateFlowLayout Methods
//------------------------------------------------------------------------------

extension SignupThirdStepVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width / 3
        return CGSize(width: width, height: 30)
    }
}
