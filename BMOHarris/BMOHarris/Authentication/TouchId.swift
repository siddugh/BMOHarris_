//
//  TouchId.swift
//  VirtualCard
//
//  Created by second on 20/01/19.
//  Copyright © 2019 second. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

protocol TouchIdDelegate:AnyObject {
    func onTouchIdSuccess()
    func onTouchIdFailed()
    func onTouchIdIdNotAvailable()
}

class TouchId
{
    static var instance = TouchId()
    weak var delegate: TouchIdDelegate?
    
    private  init()
    {
        // initilize once
    }
    
    func authWithTouchID()
    {
        let context = LAContext()
        //var error: NSError?
        var localAuthenticationError: NSError?
        var localizedReason = ""
      
      if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &localAuthenticationError),
         localAuthenticationError == nil
      {
        
          let reason  = "Only card user is allowed."
          context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: {
              (succes,error) in
              if succes {
                  self.delegate?.onTouchIdSuccess()
              }
              else {
                  self.delegate?.onTouchIdFailed()
              }
          })
      } else {
        if let error = localAuthenticationError {
          print("Error: \(error)")
        }
      }
        if (context.biometryType == LABiometryType.faceID)
        {
            localizedReason = "Unlock using Face ID : \(localizedReason)"
            print("FaceId support")
        } else if (context.biometryType == LABiometryType.touchID)
        {
            localizedReason = "Unlock using Touch ID"
            print("TouchId support : \(localizedReason)")
        }
        else {
            print("No Biometric support")
        }
        // check if Touch ID is available
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
//        {
//            let reason  = "Only card user is allowed."
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: {
//                (succes,error) in
//                if succes {
//                    self.delegate?.onTouchIdSuccess()
//                }
//                else {
//                    self.delegate?.onTouchIdFailed()
//                }
//            })
//        }
//        else {
//            self.delegate?.onTouchIdIdNotAvailable()
//        }
    }    
}
