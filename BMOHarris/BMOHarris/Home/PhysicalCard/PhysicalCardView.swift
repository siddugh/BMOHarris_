//
//  PhysicalCardView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 29/09/21.
//

import UIKit

class PhysicalCardView: UIView {


  @IBOutlet weak var customSwitchView: FBCustomSwitch!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
  }
  
  private func initilize() {
    customSwitchView.delegate = self
    customSwitchView.switchActionWithoughtAnimation()
  }
}
extension PhysicalCardView: FBCustomSwitchDelegate {
  func onSwitchActionCompletion() {
    Helper.upDatePhysicalCardStatus(bLockedStatus: self.customSwitchView.isLocked)
  }
  
  func switchAction() {
    if customSwitchView.isLocked {
      print("Ask for authentication..")
      Authentication.instance.authenticate()
      Authentication.instance.delegate = self
    } else {
      customSwitchView.switchAction()
    }
  }
}

extension PhysicalCardView: AuthenticationDelegate {
  func onAuthenticationdSuccess() {
    DispatchQueue.main.async {
      self.customSwitchView.switchAction()
    }
  }
  
  func onAuthenticationdFailed() {
    
  }
  
  func onTouchFaceIdIdNotAvailable() {
    
  }
    
}
