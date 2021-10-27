//
//  AccountsContainer.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 22/09/21.
//

import UIKit

enum AccountType {
  case kCHECKING
  case kSAVING
  case kBOTH
}

protocol AccountsContainerDelegate: AnyObject {
  func selectedAccount(type: AccountType)
}

class AccountsContainer: UIView {

  var checkingAcc: CheckingAccount?
  var savAcc: SavingAccount?
  var arrowImageView: UIImageView?
  var arrowView: UIView?
  var currentAccountView: UIView = UIView()
  let accDividerView = UIView()
  var accountType: AccountType = AccountType.kBOTH
  
  var backgroundColour = UIColor(displayP3Red: 210/255, green: 228/255, blue: 250/255, alpha: 1)
  let currentSelectedAccBGColor = UIColor(hexString: "187ADC")
  weak var delegate: AccountsContainerDelegate?
  
  func initWith(checkingAcc: CheckingAccount, savingAcc: SavingAccount) {
    self.checkingAcc = checkingAcc
    self.savAcc = savingAcc
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initilize()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init() {
    self.init()
    initilize()
  }
  
  private func initilize() {
    
    initialSelectedAccount()
    
    guard let checkingAccount = getCheckingAccount() else { return }
    guard let savingAccount = getSavingsAccount() else { return }
    self.checkingAcc = checkingAccount
    self.savAcc = savingAccount
    
    initialSelectedAccount()
    setupView()
    addArrow()
    self.backgroundColor =  backgroundColour
    
    
  }
  
  private func setupView() {
    
    guard let checkingAccount = self.checkingAcc else { return }
    guard let savingAccount = self.savAcc else { return }
    
    self.addSubview(checkingAccount)
    checkingAccount.translatesAutoresizingMaskIntoConstraints = false
    checkingAccount.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    checkingAccount.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    checkingAccount.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    checkingAccount.widthAnchor.constraint(equalToConstant: self.bounds.width / 2).isActive = true
    
    self.addSubview(savingAccount)
    savingAccount.translatesAutoresizingMaskIntoConstraints = false
    savingAccount.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    savingAccount.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    savingAccount.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    savingAccount.widthAnchor.constraint(equalToConstant: self.bounds.width / 2).isActive = true
    
    savingAccount.containerView.backgroundColor = .clear
    savingAccount.backgroundColor = .clear
    checkingAccount.containerView.backgroundColor = .clear
    checkingAccount.backgroundColor = .clear
    self.clipsToBounds = true
    addDividerView()
  }
  
  private func addDividerView() {
    self.addSubview(accDividerView)
    accDividerView.frame = CGRect(x: self.bounds.width / 2 - 2, y: 5, width: 1, height: self.bounds.height - 10)
    accDividerView.backgroundColor = .white
    accDividerView.layer.cornerRadius = 5
  }
  
  private func initialSelectedAccount() {
    self.currentAccountView.frame = self.bounds
    self.addSubview(currentAccountView)
    currentAccountView.backgroundColor =  currentSelectedAccBGColor //UIColor(hexString: "187ADC")
  }
  
  private func addArrow() {
    
    if arrowView != nil {
      return
    }
    
    arrowView = UIView()
    arrowImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
    
    guard let arrView = arrowView else { return }
    guard let arrImageView = arrowImageView else {
      return
    }
    arrView.backgroundColor = .white
    self.addSubview(arrView)
    self.addSubview(arrImageView)
    arrView.frame = CGRect(x: self.bounds.width / 2 - 9, y: self.bounds.height / 2 - 8, width: 15, height: 15)
    arrView.layer.cornerRadius = arrView.bounds.width / 2
    
    
    arrImageView.translatesAutoresizingMaskIntoConstraints = false
    arrImageView.image = UIImage(named: "leftarrow")
    arrImageView.contentMode = .scaleAspectFit
    arrImageView.widthAnchor.constraint(equalToConstant: 7).isActive = true
    arrImageView.heightAnchor.constraint(equalToConstant: 7).isActive = true
    arrImageView.centerYAnchor.constraint(equalTo: arrView.centerYAnchor, constant: 0).isActive = true
    arrImageView.centerXAnchor.constraint(equalTo: arrView.centerXAnchor, constant: 0).isActive = true
    
    hideArrow()
  }
  
  func showSelectedACcount(accountType: AccountType) {
    
    switch accountType {
    case .kCHECKING:
      showCheckingAccount()
    case .kSAVING:
      showSavingAccount()
    case .kBOTH:
      showBothAccountSelected()
    }
  }
  
  private func showArrow() {
    arrowView?.alpha = 1
    arrowImageView?.alpha = 1
    accDividerView.alpha = 0
  }
  
  private func hideArrow() {
    arrowView?.alpha = 0
    arrowImageView?.alpha = 0
    accDividerView.alpha = 1
  }
  
  @objc func showCheckingAccount() {
    UIView.animate(withDuration: 0.4) {
      self.currentAccountView.frame = CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: self.bounds.height)
      self.currentAccountView.layer.cornerRadius = 15
      self.arrowImageView?.transform = CGAffineTransform.init(rotationAngle: 0 )
      self.savAcc?.showAsUnSelected()
      self.checkingAcc?.showAsSelected()
    } completion: { _ in
      self.accountType = .kCHECKING
      self.showArrow()
    }

  }
  
  @objc  func showSavingAccount() {
    
      UIView.animate(withDuration: 0.4) {
        self.currentAccountView.frame = CGRect(x: self.bounds.width / 2, y: 0, width: self.bounds.width / 2, height: self.bounds.height)
        self.currentAccountView.layer.cornerRadius = 15
        self.arrowImageView?.transform = CGAffineTransform.init(rotationAngle: (CGFloat(Double.pi) * 180) / 180 )
        self.savAcc?.showAsSelected()
        self.checkingAcc?.showAsUnSelected()
      } completion: { _ in
        self.accountType = .kSAVING
        self.showArrow()
    }
  }
  @objc func showBothAccountSelected() {
    UIView.animate(withDuration: 0.4) {
      self.currentAccountView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
      self.currentAccountView.layer.cornerRadius = 15
      self.savAcc?.showAsSelected()
      self.checkingAcc?.showAsSelected()
      self.hideArrow()
    } completion: { _ in
      self.accountType = .kBOTH
    }
  }
  
  private func getCheckingAccount() -> CheckingAccount? {
    if let checkingaccount = UINib(nibName: "CheckingAccount", bundle: nil).instantiate(withOwner: nil, options: nil).first as? CheckingAccount {
      
      return checkingaccount
    }
    return nil
  }
  
  private func getSavingsAccount() -> SavingAccount? {
    if let savingsAccount = UINib(nibName: "SavingAccount", bundle: nil).instantiate(withOwner: nil, options: nil).first as? SavingAccount {
      
      return savingsAccount
    }
    return nil
  }
  
  func enableAccountSelection() {
    let gesture = UITapGestureRecognizer(target: self, action: #selector(handleCheckingAccSelection))
    if let accountView = checkingAcc {
      accountView.addGestureRecognizer(gesture)
    }
    
    let savAccGesture = UITapGestureRecognizer(target: self, action: #selector(handleSavingAccSelection))
    if let accountView = savAcc {
      accountView.addGestureRecognizer(savAccGesture)
    }
  }
  
  @objc func handleCheckingAccSelection() {
    print("handle CheckingAcc Selection...")
    showCheckingAccount()
    delegate?.selectedAccount(type: .kCHECKING)
  }

  @objc func handleSavingAccSelection() {
    print("handle SavingAcc Selection...")
    showSavingAccount()
    delegate?.selectedAccount(type: .kSAVING)
  }

}
