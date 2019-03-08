//
//  SignupStepperVC.swift
//  Meeps
//
//  Created by Sagar on 06/03/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit
class SignupStepperVC: UIViewController {

    //------------------------------------------------------------------------------
    // MARK:- Outlets
    //------------------------------------------------------------------------------
    
    @IBOutlet weak var btnGoDo                  : UIButton!
    
    @IBOutlet weak var svSignup                 : UIScrollView!
    @IBOutlet weak var contentView              : UIView!
    
    @IBOutlet weak var btnFirstStep             : UIButton!
    @IBOutlet weak var btnSecondStep            : UIButton!
    @IBOutlet weak var btnThirdStep             : UIButton!
    
    @IBOutlet weak var viewFirstStep            : UIView!
    @IBOutlet weak var viewSecondStep           : UIView!
    
    
    //------------------------------------------------------------------------------
    // MARK:- Variables
    //------------------------------------------------------------------------------
    
    var screenWidth                             : Int!
    var screenPageNumber                        : Int = 0
    var arrCustomerHeader                       : [String]?
    
    var refSignupFirstStepVC                    : SignupFirstStepVC?
    var refSignupSecondStepVC                   : SignupSecondStepVC?
    var refSignupThirdStepVC                    : SignupThirdStepVC?
    
    
    //------------------------------------------------------------------------------
    // MARK:- Action Methods
    //------------------------------------------------------------------------------
    
    @IBAction func btnGoDoTapped(_ sender: UIButton) {
        
    }
    
    //------------------------------------------------------------------------------
    
    @IBAction func btnFirstStepTapped(_ sender: UIButton) {
        self.scrollToPosition(self.screenWidth * 0)
    }
    
    //------------------------------------------------------------------------------
    
    @IBAction func btnSecondStepTapped(_ sender: UIButton) {
        self.scrollToPosition(self.screenWidth * 1)
    }
    
    //------------------------------------------------------------------------------
    
    @IBAction func btnThirdStepTapped(_ sender: UIButton) {
        self.scrollToPosition(self.screenWidth * 2)
    }
    
    
    //------------------------------------------------------------------------------
    // MARK:- Custom Methods
    //------------------------------------------------------------------------------
    
    func setupView() {
        
        self.screenWidth = Int(self.svSignup.frame.size.width)
    }
    
    //------------------------------------------------------------------------------
    
    func scrollToPosition(_ withPosition: Int) {
        if withPosition >= 0 {
            if withPosition != Int(self.svSignup.contentOffset.x) {
                self.svSignup.setContentOffset(CGPoint(x: withPosition, y: 0), animated: true)
            }
        }
    }
    
    
    //------------------------------------------------------------------------------
    // MARK:- UIStoryboardSegue Methods
    //------------------------------------------------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SignupFirstStepVC" {
            
            let signupFirstStepVC = segue.destination as! SignupFirstStepVC
            self.refSignupFirstStepVC = signupFirstStepVC
            
        } else if segue.identifier == "SignupSecondStepVC" {
            
            let signupSecondStepVC = segue.destination as! SignupSecondStepVC
            self.refSignupSecondStepVC = signupSecondStepVC
            
        } else if segue.identifier == "SignupThirdStepVC" {
            
            let signupThirdStepVC = segue.destination as! SignupThirdStepVC
            self.refSignupThirdStepVC = signupThirdStepVC
            
        }
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
// MARK:- Extension - UIScrollViewDelegate Methods
//------------------------------------------------------------------------------

extension SignupStepperVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == svSignup {
            
            let pageWidth = scrollView.frame.size.width
            let page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
            self.screenPageNumber = Int(page)
        }
    }
}


extension UIView {
    
    // set Radius
    func setCornerRadius(radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
}
