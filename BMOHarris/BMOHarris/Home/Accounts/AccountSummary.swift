//
//  AccountSummary.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 30/09/21.
//

import UIKit

enum AccountSummaryDetails {
  case kCurrentPostedBalance
  case kPendingDebts
  case kPendingCredits
  case kAvailableBalance
}

enum CheckingAccSummary {
  case kCurrentPostedBalance
  case kPendingDebts
  case kPendingCredits
  case kAvailableBalance
}

enum SavingAccSummary {
  case kCurrentPostedBalance
  case kPendingDebts
  case kPendingCredits
  case kAvailableBalance
  case kIntrestEarned
  case kGeneralSavings
  case kTripGoal
  case kEnmergencyFundGoal
}

enum AccountSummaryType {
  case kChecking
  case kSaving
}


class AccountSummary: UIView {

  var type: AccountSummaryType = AccountSummaryType.kChecking
  var checkingAccSummary: CheckingAccountSummary?
  var savingAccSummary: SavingAccountSummary?
  

  var isShowingSummary = false
  var expandHeight = 200
  var closedHeight = 55
  var originalFrame: CGRect = .zero
  var summaryViewHeight: NSLayoutConstraint?
  
  let activeLabel = UILabel()
  let arroImageView = UIImageView()
  let dividerLineLabel = UILabel()
  
  let leadingSpace:CGFloat = 15
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  convenience init(frame: CGRect, type: AccountSummaryType) {
    self.init(frame: frame)
    self.originalFrame = frame
    self.type = type
    self.layer.cornerRadius = 15
    self.backgroundColor = .white
    initilize()
  }
  
  private func initilize() {
    addTapGesture()
    addHeaderView()
  }
  
  private func addSummary(type: AccountSummaryType) {
    
    switch type {
    case .kChecking:
      addCheckingSummary()
      break
    case .kSaving:
      addSavingAccountSummary()
    }
  }
  
  private func addHeaderView() {
    let checkingAcctSummary = UILabel()
    checkingAcctSummary.text = "Account Summary"
    self.addSubview(checkingAcctSummary)
    checkingAcctSummary.translatesAutoresizingMaskIntoConstraints = false
    checkingAcctSummary.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingSpace).isActive = true
    checkingAcctSummary.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
    checkingAcctSummary.font = UIFont(name: "Rubik Medium", size: 14)
    checkingAcctSummary.textColor = .black
    
    
    self.addSubview(activeLabel)
    activeLabel.text = "Active"
    activeLabel.textColor = UIColor(hexString: "49951A")
    activeLabel.translatesAutoresizingMaskIntoConstraints = false
    activeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35).isActive = true
    activeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
    activeLabel.font = UIFont(name: "Rubik Light", size: 14)
    
    arroImageView.image = UIImage(named: "downarrow-1")
    self.addSubview(arroImageView)
    arroImageView.translatesAutoresizingMaskIntoConstraints = false
    arroImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    arroImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
    arroImageView.widthAnchor.constraint(equalToConstant: 8).isActive = true
    arroImageView.heightAnchor.constraint(equalToConstant: 8).isActive = true
    arroImageView.backgroundColor = .white
    arroImageView.contentMode = .scaleAspectFit
    
    
    self.addSubview(dividerLineLabel)
    dividerLineLabel.translatesAutoresizingMaskIntoConstraints = false
    dividerLineLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingSpace).isActive = true
    dividerLineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingSpace).isActive = true
    dividerLineLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
    dividerLineLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
    dividerLineLabel.backgroundColor = UIColor(hexString: "D8D8D8")
    dividerLineLabel.alpha = 0
    
  }
  
  private func addCheckingSummary() {
    checkingAccSummary = UINib(nibName: "CheckingAccountSummary", bundle: nil).instantiate(withOwner: nil, options: nil).first as? CheckingAccountSummary
    self.addSubview(checkingAccSummary!)
    checkingAccSummary?.frame = CGRect(x: 10, y: 55, width: self.bounds.width - 20, height: 0)
    checkingAccSummary?.layer.cornerRadius = 15
  }
  
  private func addSavingAccountSummary() {
    savingAccSummary = UINib(nibName: "SavingAccountSummary", bundle: nil).instantiate(withOwner: nil, options: nil).first as? SavingAccountSummary
    self.addSubview(savingAccSummary!)
    savingAccSummary?.frame = CGRect(x: 10, y: 55, width: self.bounds.width - 20, height: 0)
    savingAccSummary?.layer.cornerRadius = 15
  }

  
  private func addTapGesture() {
    self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
  }
  
  @objc private func handleTapGesture() {
    print("handleTapGesture...")
    if !isShowingSummary {
      switch type {
      case .kChecking:
        addCheckingSummary()
        print("")
      case .kSaving:
        addSavingAccountSummary()
      }
    }
    showSummary()
    isShowingSummary = !isShowingSummary
  }
  
  private func showSummary() {
    let frame = self.frame
    var summaryFrame: CGRect = .zero
    let checkingAccSumHeight: CGFloat = 150
    let savAccSumHeight: CGFloat = 340
        
    var height = 0
    var animateFrame: CGRect = .zero
            
    if checkingAccSummary != nil {
      summaryFrame = checkingAccSummary!.frame
      height = !isShowingSummary ? 150 : 0
      animateFrame = !isShowingSummary ? CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height:frame.size.height +  checkingAccSumHeight) : originalFrame

    }
    if savingAccSummary != nil {
      summaryFrame = savingAccSummary!.frame
      height = !isShowingSummary ? 250 : 0
      animateFrame = !isShowingSummary ? CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height:frame.size.height +  savAccSumHeight) : originalFrame

    }
    
    let divicerLineAlpha  = !isShowingSummary ? 1 : 0
    
    summaryFrame = CGRect(x: summaryFrame.origin.x, y: summaryFrame.origin.y, width: summaryFrame.size.width, height: CGFloat(height))
    UIView.animate(withDuration: 0.5) {
      self.frame = animateFrame
      self.dividerLineLabel.alpha = CGFloat(divicerLineAlpha)
    } completion: { _ in
      self.removeSummary()
    }
  }
  
  private func removeSummary() {
    if self.checkingAccSummary != nil, self.isShowingSummary == false {
      self.checkingAccSummary?.removeFromSuperview()
      self.checkingAccSummary = nil
      self.summaryViewHeight = nil
    }
    
    if self.savingAccSummary != nil, self.isShowingSummary == false {
      self.savingAccSummary?.removeFromSuperview()
      self.savingAccSummary = nil
      self.summaryViewHeight = nil
    }

  }
}
