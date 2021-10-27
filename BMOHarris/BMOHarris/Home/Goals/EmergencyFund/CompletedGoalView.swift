//
//  CompletedGoalView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

class CompletedGoalView: UIView {

 
  @IBOutlet weak var bgViewTwo: UIView!
  @IBOutlet weak var bgViewOne: UIView!
  
  func initilize() {
    bgViewOne.layer.cornerRadius = 12
    bgViewTwo.layer.cornerRadius = 12
  }
  
}
