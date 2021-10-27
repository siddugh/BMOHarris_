//
//  ReviewNewGoalVIew.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

protocol ReviewNewGoalVIewDelegare:class {
  func startgoal()
}

class ReviewNewGoalVIew: UIView {
  
  @IBOutlet weak var switchOneNob: UIView!
  @IBOutlet weak var switchTwoNob: UIView!
  @IBOutlet weak var statbutton: UIButton!
  
  @IBOutlet weak var onbOneLeadOnstraint: NSLayoutConstraint!
  @IBOutlet weak var onbtwoLeadOnstraint: NSLayoutConstraint!
  
  
  weak var delegate: ReviewNewGoalVIewDelegare?
  func initilize() {
    statbutton.layer.cornerRadius = 23
    switchOneNob.layer.cornerRadius = 10
    switchTwoNob.layer.cornerRadius = 10
        
    
    addgestures()
  }
  
  func addgestures() {
    
    switchOneNob.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleswitchoneGesture)))
    switchTwoNob.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleswitchTwoGesture)))
    

  }
  
  @objc func handleswitchoneGesture() {
    print("handleswitchoneGesture")
    UIView.animate(withDuration: 0.4) {
    }
    
    UIView.animate(withDuration: 0.4) {
      self.onbOneLeadOnstraint.constant = (self.onbOneLeadOnstraint.constant == 0) ? 26 : 0
      self.layoutIfNeeded()
    } completion: { (_) in
      self.switchOneNob.backgroundColor  = (self.onbOneLeadOnstraint.constant == 0) ?  UIColor(hexString: "F16969") :  UIColor(hexString: "80C376")
    }

  }

  @objc func handleswitchTwoGesture() {
    print("handleswitchTwoGesture")
    
    UIView.animate(withDuration: 0.4) {
      self.onbtwoLeadOnstraint.constant = (self.onbtwoLeadOnstraint.constant == 0) ? 26 : 0
      self.layoutIfNeeded()
    } completion: { (_) in
      self.switchTwoNob.backgroundColor  = (self.onbtwoLeadOnstraint.constant == 0) ? UIColor(hexString: "F16969") : UIColor(hexString: "80C376")
    }

  }
  @IBAction func switch1buttonActio0n(_ sender: Any) {
    handleswitchoneGesture()
  }
  
  @IBAction func swtch2buttonACtion(_ sender: Any) {
    handleswitchTwoGesture()
  }
  
  @IBAction func statgoalbuttonACtion(_ sender: Any) {
    delegate?.startgoal()
  }
}
