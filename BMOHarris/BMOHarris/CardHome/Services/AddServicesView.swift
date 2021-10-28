//
//  AddServicesView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 30/04/21.
//

import UIKit

class AddServicesView: UIView {

  @IBOutlet weak var addService: AddServiceView!
  @IBOutlet weak var movemoneyService: AddServiceView!
  @IBOutlet weak var savinggoalService: AddServiceView!
  
  func initlize() {
 
    addService.initlize()
    movemoneyService.initlize()
    savinggoalService.initlize()
  }
}
