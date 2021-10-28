//
//  BankSelectionView.swift
//  BMO
//
//  Created by Siddu Hallikeri on 17/04/21.
//

import UIKit

protocol BankSelectionViewDelegate:class {
  func selectedBank(bankView:BankSelectionView)
}

class BankSelectionView: UIView {

  @IBOutlet weak var checkMarkView:UIView!
  @IBOutlet weak var bankLogoImageView:UIImageView!
  @IBOutlet weak var banknameLabel:UILabel!
  
  var checkMarkImageView: UIImageView?
  weak var delegate: BankSelectionViewDelegate?
  
  
  func initilize() {
    
    checkMarkImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
    
    addCheckMarkGesture()
    checkMarkView.layer.cornerRadius = 5
    checkMarkImageView?.layer.cornerRadius = 5
    checkMarkImageView?.translatesAutoresizingMaskIntoConstraints = false
    checkMarkImageView?.image = UIImage(named: "check-ui")
  }
  
  func selectBank() {
    checkMarkView.backgroundColor = .green
  }

  private func addCheckMarkGesture() {
    checkMarkView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCheckMarkGesture)))
  }
  
  @objc func handleCheckMarkGesture() {
    print("handleCheckMarkGesture...")
    delegate?.selectedBank(bankView: self)
  }
  func select() {
    self.checkMarkImageView?.removeFromSuperview()
    
    UIView.animate(withDuration: 0.4) {
      self.checkMarkView.addSubview(self.checkMarkImageView!)
      self.checkMarkView.backgroundColor = UIColor(hexString: "46BD48")
      self.checkMarkImageView?.centerYAnchor.constraint(equalTo: self.checkMarkView.centerYAnchor).isActive = true
      self.checkMarkImageView?.centerXAnchor.constraint(equalTo: self.checkMarkView.centerXAnchor).isActive = true
    }
  }
    
  
  func unsSelect() {
    UIView.animate(withDuration: 0.4) {
      self.checkMarkView.backgroundColor = UIColor(hexString: "ECECEC")
      self.checkMarkImageView?.removeFromSuperview()
    }
  }

}

