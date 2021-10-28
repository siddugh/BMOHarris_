//
//  ContactInfoView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit


protocol ContactInfoViewdelegate:class {
  func submit()
  func moveBack()
}

class ContactInfoView: UIView {
  
  @IBOutlet weak var submitButton: UIButton!
  @IBOutlet weak var backButton: UIButton!
  
  @IBOutlet weak var nameContactInfo: ContactInfo!
  @IBOutlet weak var lastNameContactInfo: ContactInfo!
  @IBOutlet weak var addressContactInfo: ContactInfo!
  @IBOutlet weak var addressContinueContactInfo: ContactInfo!
  
  weak var delegate: ContactInfoViewdelegate?
  
  func initilize() {
    submitButton.layer.cornerRadius  = 25
    nameContactInfo.initilize()
    lastNameContactInfo.initilize()
    addressContactInfo.initilize()
    addressContinueContactInfo.initilize()
  }
  
  @IBAction func submitButtonAction(_ sender: Any) {
    print("submitButtonAction...")
    delegate?.submit()
  }
  
  @IBAction func backButtonAction(_ sender: Any) {
    print("backButtonAction...")
    delegate?.moveBack()
  }
}
