//
//  UserEmploymentInfo.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

protocol UserEmploymentInfoDelegate:class {
  func submit()
  func moveBack()
}

class UserEmploymentInfo: UIView {

  @IBOutlet weak var submitButton:UIButton!
  @IBOutlet weak var backButton:UIButton!
  @IBOutlet  var empInfoView:[EmploymentInfoView]!
  
  weak var delegate: UserEmploymentInfoDelegate?
  
  func initilize() {
    submitButton.layer.cornerRadius = 23
    empInfoView.forEach { (infoView) in
      infoView.bgView.layer.cornerRadius = 10
    }
    empInfoView[0].downArrowImageView.alpha = 0
    
  }
  
  @IBAction func submitButtonAction(_ sender: Any) {
    delegate?.submit()
  }
  
  @IBAction func backButtonAction(_ sender: Any) {
    delegate?.moveBack()
  }
}
