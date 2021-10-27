//
//  PhysicalCardViewController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 29/09/21.
//

import UIKit

class PhysicalCardViewController: UIViewController {

  var physicalCardView: PhysicalCardView!
  
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
      addPhysicalCardView()
    }
  
  override func loadView() {
    super.loadView()
  }
  
  private func addPhysicalCardView() {
    physicalCardView = UINib(nibName: "PhysicalCardView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? PhysicalCardView
    physicalCardView.frame = view.bounds
    physicalCardView.customSwitchView.switchActionWithoughtAnimation()
    
    view.addSubview(physicalCardView)
  }
}

