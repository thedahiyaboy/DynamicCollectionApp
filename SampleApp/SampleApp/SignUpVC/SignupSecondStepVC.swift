//
//  SignupSecondStepVC.swift
//  Meeps
//
//  Created by Sagar on 06/03/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class SignupSecondStepVC: UIViewController {
    
    //------------------------------------------------------------------------------
    // MARK:- Outlets
    //------------------------------------------------------------------------------
    
    @IBOutlet weak var labelChooseOptions           : UILabel!
    @IBOutlet weak var tblSubCategory               : UITableView!
    
    
    //------------------------------------------------------------------------------
    // MARK:- Custom Methods
    //------------------------------------------------------------------------------
    
    func setupView() {
        self.tblSubCategory.register(SubCategoryTVC.Nib(), forCellReuseIdentifier: "SubCategoryTVC")
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
// MARK:-
// MARK:- Extension - UITableViewDataSource Methods
//------------------------------------------------------------------------------

extension SignupSecondStepVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryTVC", for: indexPath) as! SubCategoryTVC
        
        cell.lblCategoryName.text = "Category \(indexPath.row)"
        cell.setCollectionView(forRow: indexPath.row)
        cell.cvSubcategory.register(SubCategoryCVC.Nib(), forCellWithReuseIdentifier: "SubCategoryCVC")
        
        return cell
    }
}


