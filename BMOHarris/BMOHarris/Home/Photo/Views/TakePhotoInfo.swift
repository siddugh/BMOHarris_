//
//  TakePhotoInfo.swift
//  BMO
//
//  Created by Siddu Hallikeri on 17/04/21.
//

import UIKit

protocol TakePhotoInfoDelegate:class {
  func backAction()
  func openCamera()
}

class TakePhotoInfo: UIView {

  @IBOutlet weak var openCameraButton:UIButton!
  @IBOutlet weak var backButton:UIButton!
  @IBOutlet weak var textLabel1: UILabel!
  @IBOutlet weak var textLabel2: UILabel!
  
  weak var delegate: TakePhotoInfoDelegate?
  
  func initilize() {
    openCameraButton.layer.cornerRadius = 23
  }
  
  @IBAction func openCameraAction(_ sender: Any) {
    delegate?.openCamera()
  }

  @IBAction func backButtonAction(_ sender: Any) {
    delegate?.backAction()
  }


}
