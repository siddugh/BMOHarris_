//
//  Authentication.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 26/10/21.
//

import Foundation


protocol AuthenticationDelegate: AnyObject {
  func onAuthenticationdSuccess()
  func onAuthenticationdFailed()
  func onTouchFaceIdIdNotAvailable()
}

class Authentication {
  
  static var instance = Authentication()
  weak var delegate: AuthenticationDelegate?
  
  func authenticate() {
    TouchId.instance.delegate = self
    TouchId.instance.authWithTouchID()
  }
}


extension Authentication: TouchIdDelegate {
  func onTouchIdSuccess() {
    delegate?.onAuthenticationdSuccess()
  }
  
  func onTouchIdFailed() {
    delegate?.onAuthenticationdFailed()
  }
  
  func onTouchIdIdNotAvailable() {
    delegate?.onTouchFaceIdIdNotAvailable()
  }
}
