//
//  IdentityProofView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 19/04/21.
//

import UIKit

protocol IdentityProofViewDelegate:class {
  func uploadPhotoIdentity()
  func uploadAddressIdentity()
  func useDriverLicense()
  func submit()
  func moveBack()
}

class IdentityProofView: UIView {

  @IBOutlet weak var uolpadPhotoIdentitybt:UIButton!
  @IBOutlet weak var uolpadDriverIdentitybt:UIButton!
  @IBOutlet weak var uolpadAddressIdentitybt:UIButton!
  
  @IBOutlet weak var photoIdentityView:UIView!
  @IBOutlet weak var addressIdentityView:UIView!
  
  @IBOutlet weak var submitButton:UIButton!
  @IBOutlet weak var backButton:UIButton!
  
  @IBOutlet weak var phIdentityVIewHTConstraint: NSLayoutConstraint!
  @IBOutlet weak var addressIdentityViewHTCOnstraint: NSLayoutConstraint!
  @IBOutlet weak var photoProofImageView: UIImageView!
  @IBOutlet weak var addressProofImageView: UIImageView!
  
  weak var delegate: IdentityProofViewDelegate?
  
  func initilize() {
    uolpadPhotoIdentitybt.layer.cornerRadius = 20
    uolpadAddressIdentitybt.layer.cornerRadius = 20
    submitButton.layer.cornerRadius = 23
  }
  
  func setPhotoUpLoadTitle(title:String) {
    UIView.animate(withDuration: 0.3) {
      self.uolpadPhotoIdentitybt.setTitle(title, for: .normal)
    }
  }
  
  @IBAction func uploadPhotoIdentityBTAction(_ sender: Any) {
    delegate?.uploadPhotoIdentity()
  }
  
  @IBAction func driverIdentityButtonAction(_ sender: Any) {
    delegate?.useDriverLicense()
  }
  @IBAction func uploadAddressIdentityAction(_ sender: Any) {
    delegate?.uploadAddressIdentity()
  }
  @IBAction func submitButtonAction(_ sender: Any) {
    delegate?.submit()
  }
  
  @IBAction func backButtonAction(_ sender: Any) {
    delegate?.moveBack()
  }
}
