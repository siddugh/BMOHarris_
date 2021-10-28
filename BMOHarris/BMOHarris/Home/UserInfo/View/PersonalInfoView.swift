//
//  PersonalInfoView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

protocol PersonalInfoViewDelegate:class {
  func submit()
  func moveBack()
}

class PersonalInfoView: UIView {
  
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var submitButton: UIButton!
  @IBOutlet weak var contactInfo: ContactInfo!
  @IBOutlet weak var contactInfo1: ContactInfo!
  
  
  weak var delegate: PersonalInfoViewDelegate?
  
  func initilize() {
    submitButton.layer.cornerRadius  = 23
    contactInfo.initilize()
    contactInfo1.initilize()
  }
  @IBAction func submitButtonAciton(_ sender: Any) {
    print("submitButtonAciton")
    delegate?.submit()
  }
  
  @IBAction func backButtonAction(_ sender: Any) {
    delegate?.moveBack()
  }
}
