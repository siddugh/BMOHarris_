//
//  CardView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 23/09/21.
//

import UIKit

protocol CardViewDelegate: AnyObject {
  func onAuthenticationSuccess(bLocked: Bool)
  func onAuthenticationFailed()
  func authenticationNotAvailable()
}
protocol CardViewShowMoreDelegate: AnyObject {
  func showMore()
}


class CardView: UIView {

  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var moreButton: UIButton!
  @IBOutlet weak var cardNumLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var nameBgView: UIView!
  @IBOutlet weak var validThrTxtLabel: UILabel!
  @IBOutlet weak var validThrLabel: UILabel!
  @IBOutlet weak var cvvTxtLabel: UILabel!
  @IBOutlet weak var cvvLabel: UILabel!
  @IBOutlet weak var customSwitch: FBCustomSwitch!
  
  weak var delegate: CardViewDelegate?
  weak var showMoreDelegate: CardViewShowMoreDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    initilize()
    self.clipsToBounds = true
  }
  
  func initilize() {
    
    containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
    containerView.layer.shadowRadius = 1.0
    containerView.layer.shadowOpacity = 0.3
    
    containerView.layer.cornerRadius = 15
    moreButton.layer.cornerRadius = 10.5
    moreButton.layer.borderWidth = 1
    moreButton.layer.borderColor = UIColor.lightGray.cgColor
    nameBgView.layer.cornerRadius = 11
    
    customSwitch.delegate = self
  }
  
  @IBAction func moreButtonAction(_ sender: Any) {
    print("moreButtonAction....")
    showMoreDelegate?.showMore()
  }
  
  @objc func authentication()
  {
      TouchId.instance.delegate = self
      TouchId.instance.authWithTouchID()
  }
  
  func lockCard() {
    let frame = frame
    self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 90)
  }
  
  func unLockCard() {
    
  }
  
  func showShadow(bShodow: Bool) {
    UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
      if bShodow {
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.containerView.layer.shadowRadius = 1.0
        self.containerView.layer.shadowOpacity = 0.3
        self.containerView.layer.cornerRadius = 15
        self.containerView.backgroundColor = UIColor(hexString: "F9F9F9")
      } else {
        self.containerView.layer.shadowRadius = 0.0
        self.containerView.layer.shadowOpacity = 0.0
        self.containerView.layer.cornerRadius = 0
        self.containerView.backgroundColor = .white
      }
    } completion: { _ in
      
    }
  }
}

extension CardView: FBCustomSwitchDelegate {
  func onSwitchActionCompletion() {
    self.delegate?.onAuthenticationSuccess(bLocked: self.customSwitch.isLocked)
  }
  
  func switchAction() {
    if self.customSwitch.isLocked {
      authentication()
    } else {
      self.customSwitch.switchAction()
      //self.delegate?.onAuthenticationSuccess(bLocked: self.customSwitch.isLocked)
    }
  }
}

extension CardView: TouchIdDelegate {
  func onTouchIdSuccess() {
    DispatchQueue.main.async {
      self.customSwitch.switchAction()
    }
  }
  
  func onTouchIdFailed() {
    delegate?.onAuthenticationFailed()
  }
  
  func onTouchIdIdNotAvailable() {
    delegate?.authenticationNotAvailable()
  }
}
