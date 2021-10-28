//
//  GoalAmountDeposited.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

class GoalAmountDeposited: UIView {

  @IBOutlet var dotViews:[DotView]!
  @IBOutlet weak var bgView: UIView!
  
  func initilize() {
    
    for i in 0..<dotViews.count {
      if i < 7 {
        dotViews[i].inerDotView.backgroundColor = .clear
        dotViews[i].backgroundColor = UIColor(hexString: "2EC430")
      }
      dotViews[i].layer.cornerRadius = dotViews[i].bounds.width / 2
      dotViews[i].inerDotView.layer.cornerRadius = dotViews[i].inerDotView.bounds.width / 2
    }
    
    bgView.layer.cornerRadius = 10
    bgView.layer.shadowOffset = CGSize(width: 0, height: 1)
    bgView.layer.shadowRadius = 0.8
    bgView.layer.shadowOpacity = 0.5
  }
  
  

}
