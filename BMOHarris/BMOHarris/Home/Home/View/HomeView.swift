//
//  HomeView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 16/04/21.
//

import UIKit

protocol HomeViewDelegate:class {
  func start()
}

class HomeView: UIView {

  @IBOutlet weak var startButton:UIButton!
  @IBOutlet weak var bankBMOView:BankSelectionView!
  @IBOutlet weak var bankCITIView:BankSelectionView!
  @IBOutlet weak var bankBBVAView:BankSelectionView!
  
  weak var delegate: HomeViewDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  private func setupUI() {
    startButton.layer.cornerRadius = 23    
    bankBMOView.initilize()
    bankBMOView.delegate = self
    
    bankCITIView.initilize()
    bankCITIView.delegate = self
    
    bankBBVAView.initilize()
    bankBBVAView.delegate = self
    
    showSelectedBank(bankView: bankBMOView)
  }
  
  func setTopCornerRadius(radius:CGSize) {
    let path = UIBezierPath(roundedRect: self.frame, byRoundingCorners: [.topLeft, .topRight], cornerRadii: radius)
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
  }
  
  func showSelectedBank(bankView:BankSelectionView) {
    
    if bankView == bankBMOView {
      bankBMOView.select()
      bankCITIView.unsSelect()
      bankBBVAView.unsSelect()
    }
    if bankView == bankCITIView {
      bankBMOView.unsSelect()
      bankCITIView.select()
      bankBBVAView.unsSelect()
    }

    if bankView == bankBBVAView {
      bankBMOView.unsSelect()
      bankCITIView.unsSelect()
      bankBBVAView.select()
    }
  }
    
  @IBAction func startAction(_ sender: Any) {
    delegate?.start()
  }
}

extension HomeView:BankSelectionViewDelegate {
  func selectedBank(bankView: BankSelectionView) {
    showSelectedBank(bankView: bankView)
  }
}
