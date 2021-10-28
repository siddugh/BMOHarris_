//
//  AccountAndCardServiceController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 25/10/21.
//

import UIKit

class AccountAndCardServiceController: UIViewController {

    var headerView: Header!
    var cardView: CardView!
    var accsummary: AccountsSummaryView!
    var showingAddFestures = false
    var addFeatureView = UIView()
    var addFeatureViewHeightConstraint: NSLayoutConstraint!
    var serviceView: AddServicesView?
    var cardViewHeightConstraint: NSLayoutConstraint!
  
    var accountType: AccountType = AccountType.kCHECKING
  
    let checkingAccScrollView = UIScrollView()
    let savingAccScrollView = UIScrollView()
    let addButton = UIButton()
  

    
  
  var accSelectionView: AccountsContainer!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = .white
      addHeaderView()
      addAccountSelectionView()
      addCardView()
      self.perform(#selector(delayedView), with: nil, afterDelay: 0.0)
    }
  
  @objc private func delayedView() {
    addAccountSummary()
    addSavingAccSummary()
    showCheckingAccount()
    addAddButton()

  }
  
  private func addHeaderView() {
    headerView = ViewFactory().getAccountCardServiceHeaderView()
    view.addSubview(headerView)
    headerView.translatesAutoresizingMaskIntoConstraints = false
    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    headerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    headerView.delegate = self
    
  }
  
  private func addAccountSelectionView() {
    
    accSelectionView = AccountsContainer(frame: CGRect(x: 15, y: 100, width: self.view.bounds.width - 30, height: 100))
    accSelectionView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(accSelectionView)
    accSelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    accSelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    accSelectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 15).isActive = true
    accSelectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    accSelectionView.accountType = .kCHECKING
    accSelectionView.showSelectedACcount(accountType: .kCHECKING)
    accSelectionView.enableAccountSelection()
    accSelectionView.layer.cornerRadius = 15
    accSelectionView.delegate = self

  }
  
  private func addCardView() {
    cardView = ViewFactory().getCardView()
    self.view.addSubview(cardView)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    cardView.leadingAnchor.constraint(equalTo: accSelectionView.leadingAnchor, constant: 0).isActive = true
    cardView.trailingAnchor.constraint(equalTo: accSelectionView.trailingAnchor, constant: 0).isActive = true
    cardView.topAnchor.constraint(equalTo: accSelectionView.bottomAnchor, constant: 10).isActive = true
    cardViewHeightConstraint = cardView.heightAnchor.constraint(equalToConstant: 190)
    cardViewHeightConstraint.isActive = true
    cardView.customSwitch.isLocked = true
    cardView.delegate = self
    cardView.showMoreDelegate = self
    cardViewHeightConstraint.constant = 60
    self.cardView.nameBgView.alpha = 0
    self.cardView.nameLabel.alpha  = 0
    self.cardView.moreButton.alpha = 0
    self.cardView.showShadow(bShodow: false)    
  }
  
  func lockCardView() {
    cardViewHeightConstraint.constant = 60
    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut) {
      self.view.layoutIfNeeded()
      self.cardView.nameBgView.alpha = 0
      self.cardView.nameLabel.alpha  = 0
      self.cardView.moreButton.alpha = 0
      self.cardView.showShadow(bShodow: false)
    } completion: { _ in
    }
  }
  
  func unLockCardView() {
    cardViewHeightConstraint.constant = 190
    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut) {
      self.view.layoutIfNeeded()
      self.cardView.nameBgView.alpha = 1
      self.cardView.nameLabel.alpha  = 1
      self.cardView.moreButton.alpha = 1
      self.cardView.showShadow(bShodow: true)
    } completion: { _ in
    }
  }
  
  func addAccountSummary() {
            
    self.view.addSubview(checkingAccScrollView)
    checkingAccScrollView.backgroundColor = .white
    checkingAccScrollView.translatesAutoresizingMaskIntoConstraints = false
    
    checkingAccScrollView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 0).isActive = true
    checkingAccScrollView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0).isActive = true
    checkingAccScrollView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 0).isActive = true
    checkingAccScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    checkingAccScrollView.showsVerticalScrollIndicator = false
    checkingAccScrollView.contentSize = CGSize(width: cardView.bounds.width, height: 600)
    self.perform(#selector(showCheckingAccTransactions), with: nil, afterDelay: 0.0)
    
  }
  
  @objc private func showCheckingAccTransactions() {
    accsummary =  AccountsSummaryView(type: .kCHECKING)
    checkingAccScrollView.addSubview(accsummary)
    let frame = checkingAccScrollView.bounds
    accsummary.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height + 150)
    accsummary.backgroundColor = .white
    accsummary.delegate = self
  }
  
  
  private func addSavingAccSummary() {
    
    self.view.addSubview(savingAccScrollView)
    savingAccScrollView.backgroundColor = .white
    savingAccScrollView.translatesAutoresizingMaskIntoConstraints = false
    
    savingAccScrollView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 0).isActive = true
    savingAccScrollView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0).isActive = true
    savingAccScrollView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 0).isActive = true
    savingAccScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    savingAccScrollView.showsVerticalScrollIndicator = false
    savingAccScrollView.contentSize = CGSize(width: cardView.bounds.width, height: 600)
    self.perform(#selector(showSavingAccDetails), with: nil, afterDelay: 0.0)

  }

  @objc func showSavingAccDetails() {
    let savingAccummary =  AccountsSummaryView(type: .kSAVING)
    savingAccScrollView.addSubview(savingAccummary)
    savingAccummary.frame = savingAccScrollView.bounds
    savingAccummary.backgroundColor = .white
    savingAccummary.delegate = self
  }
  
  private func showCheckingAccount(){
    print("showCheckingAccount....")
    savingAccScrollView.contentSize = CGSize(width: cardView.bounds.width, height: 600)
    checkingAccScrollView.contentSize = CGSize(width: cardView.bounds.width, height: 800)
    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut) {
      self.checkingAccScrollView.alpha = 1
      self.savingAccScrollView.alpha = 0
    } completion: { _ in
    }

  }
  
  private func showSavingAccount() {
    print("showSavingAccount....")
    checkingAccScrollView.contentSize = CGSize(width: cardView.bounds.width, height: 600)
    self.savingAccScrollView.contentSize = CGSize(width: cardView.bounds.width, height: 800)
    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut) {
      self.checkingAccScrollView.alpha = 0
      self.savingAccScrollView.alpha = 1
    } completion: { _ in
    }
  }
  
  func addAddButton() {
    
    view.addSubview(addButton)
    addFeatureView.backgroundColor = .clear
    addButton.frame = CGRect(x: view.bounds.width - 80, y: view.bounds.height - 115, width: 60, height: 60)
    addButton.addTarget(self, action: #selector(addFeatures), for: .touchUpInside)
    addButton.setImage(UIImage(named: "addbutton"), for: .normal)
    addButton.backgroundColor = .clear
    
    view.addSubview(addFeatureView)
    addFeatureView.translatesAutoresizingMaskIntoConstraints = false
    addFeatureView.leadingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -80).isActive = true
    addFeatureView.trailingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 0).isActive = true
    addFeatureView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: 0).isActive = true
    addFeatureViewHeightConstraint = addFeatureView.heightAnchor.constraint(equalToConstant: 0)
    addFeatureViewHeightConstraint.isActive = true
    
    
    serviceView = (Bundle.main.loadNibNamed("AddServicesView", owner: self, options: nil)!.first as! AddServicesView)
    serviceView?.initlize()
    addFeatureView.addSubview(serviceView!)
    serviceView?.frame = addFeatureView.bounds
    serviceView?.clipsToBounds = true
    addFeatureView.alpha = 0
  }
  
  func addStackView() {
    let stackView = UIStackView()
    stackView.axis = .vertical
    view.addSubview(stackView)
    stackView.alignment = .fill
    stackView.distribution = .fill //.fillEqually
    let v = UIView()
    v.backgroundColor = .green
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.leadingAnchor.constraint(equalTo: self.addButton.leadingAnchor, constant: 0).isActive = true
    stackView.trailingAnchor.constraint(equalTo: self.addButton.trailingAnchor, constant: 0).isActive = true
    stackView.bottomAnchor.constraint(equalTo: self.addButton.bottomAnchor, constant: 0).isActive = true
    
    stackView.backgroundColor = .systemPink
    
    stackView.addArrangedSubview(v)
    stackView.addArrangedSubview(v)
    stackView.addArrangedSubview(v)
    stackView.addArrangedSubview(v)
    
  }
  
  @objc func addFeatures () {
    print("addFeatures")


    UIView.animate(withDuration: 0.5) {
      self.addButton.transform = self.showingAddFestures ? CGAffineTransform.identity : CGAffineTransform(rotationAngle: CGFloat.pi / 4)
      
      if self.accountType == .kCHECKING {
        self.addFeatureViewHeightConstraint.constant = self.showingAddFestures ? 0 : 100
      }
      if self.accountType == .kSAVING {
        self.addFeatureViewHeightConstraint.constant = self.showingAddFestures ? 0 : 45
      }

      self.addFeatureView.alpha = self.showingAddFestures ? 0 : 1
      self.view.layoutIfNeeded()
      //self.addFeatureView.backgroundColor = .green
      self.showingAddFestures = !self.showingAddFestures
    }
  }

  
}


extension AccountAndCardServiceController: HeaderDelegate {
  func backACtion() {
    navigationController?.popViewController(animated: true)
  }
}

extension AccountAndCardServiceController: CardViewShowMoreDelegate {
  func showMore() {
    let cntroller = AccDetailViewController()
    navigationController?.present(cntroller, animated: true, completion: nil)
  }
}

extension AccountAndCardServiceController: CardViewDelegate {
  func onAuthenticationSuccess(bLocked: Bool) {
    print("onAuthenticationSuccess...")
    if bLocked {
      unLockCardView()
    } else {
     lockCardView()
    }

  }
  
  func onAuthenticationFailed() {
    
  }
  
  func authenticationNotAvailable() {
    
  }
}


extension AccountAndCardServiceController: AccountsSummaryViewDelegate {
  func showAllTransactions() {
    print("showAllTransactions...")
    let transactions = DataProvider().getTransactions()
    let controller = TransactionsViewController(transactionsViewModel: TransactionViewModel(transactionModel: transactions))
    navigationController?.present(controller, animated: true, completion: nil)
  }
}


extension AccountAndCardServiceController: AccountsContainerDelegate {
  func selectedAccount(type: AccountType) {
    switch type {
    case .kCHECKING:
      self.accountType = .kCHECKING
      if self.accountType == .kCHECKING {
        self.serviceView?.addService.isHidden = false
        self.serviceView?.movemoneyService.isHidden = false
        self.serviceView?.savinggoalService.isHidden = true
      }

      UIView.animate(withDuration: 0.5) {
        //self.tableView.alpha = 1
        //self.savingTableView.alpha = 0
        self.addFeatureViewHeightConstraint.constant = 0
        self.view.layoutIfNeeded()
        self.addButton.transform =  CGAffineTransform.identity
      }
      showingAddFestures = false
      showCheckingAccount()
      
    case .kSAVING:
      self.accountType = .kSAVING
      if self.accountType == .kSAVING {
        self.serviceView?.addService.isHidden = true
        self.serviceView?.movemoneyService.isHidden = true
        self.serviceView?.savinggoalService.isHidden = false
      }

      UIView.animate(withDuration: 0.5) {
        //self.tableView.alpha = 0
        //self.savingTableView.alpha = 1
        self.addFeatureViewHeightConstraint.constant = 0
        self.addButton.transform =  CGAffineTransform.identity
        self.view.layoutIfNeeded()
      }
      showingAddFestures = false

      
      showSavingAccount()
    case .kBOTH:
      print("Show both")
    }
  }
}


