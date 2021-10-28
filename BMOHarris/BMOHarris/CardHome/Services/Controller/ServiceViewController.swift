//
//  ServiceViewController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 24/09/21.
//

import UIKit

class ServiceViewController: UIViewController {


  func initWith() {
    
  }  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  init(type: ServiceType) {
    super.init(nibName: nil, bundle: nil)
    switch type {
    case .kAddMoney:
      print("kAddMoney")
    case .kMoveMoney:
      print("kMoveMoney")
    case .kCreditCard:
      showAccountAndCard()
      print("kCreditCard")
    case .kLockCard:
      print("kLockCard")
    case .kFindATMs:
      print("kFindATMs")
    case .kSecurity:
      print("kSecurity")
    case .kDocs:
      print("kDocs")
    case .kSavingGoals:
      print("kSavingGoals")
    }
  }
  
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func showAccountAndCard() {
    
  }
}
