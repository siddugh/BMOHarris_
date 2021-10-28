//
//  SubmitPhoto.swift
//  BMO
//
//  Created by Siddu Hallikeri on 18/04/21.
//

import UIKit

protocol SubmitPhotoDelegate:class {
  func subbmitPhoto()
  func moveBack()
}

class SubmitPhoto: UIView {

  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var submitButton: UIButton!
  @IBOutlet weak var backButton: UIButton!
  
  weak var delegate: SubmitPhotoDelegate?
  
  func initilize() {
    
    submitButton.layer.cornerRadius = 23
  }
  
  @IBAction func submitButtonAction(_ sender: Any) {
    delegate?.subbmitPhoto()
  }
  
  @IBAction func backButtonAction(_ sender: Any) {
    delegate?.moveBack()
  }
}
