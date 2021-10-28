//
//  HomeView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 20/10/21.
//

import UIKit

class CardHomeView: UIView {

  var accountsContainer: AccountsContainer!
  var cardView: CardView!
  var serviceView: ServiceView!
  var transactionView: TransactionView!
  var goalView: GoalView!
  var scheduledPaymentView: ScheduledPaymentView!
  var spendAnalysisView: SpendAnalysisView!
  var couponsView: CouponsView!
  
  var cardViewHeightConstraint: NSLayoutConstraint!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addAccountsContainer()
    addCardView()
    addServiceView()
    addTransactionView()
    addGoalView()
    addPaymentView()
    addSpendAnalysisView()
    addCouponsView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }    
  private func addAccountsContainer() {
    accountsContainer = AccountsContainer(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 100))
    self.addSubview(accountsContainer)
    accountsContainer.layer.cornerRadius = 15
    accountsContainer.backgroundColor = .white
  }
  
  private func addCardView() {
    cardView = UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? CardView
    self.addSubview(cardView)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    cardView.topAnchor.constraint(equalTo: accountsContainer.bottomAnchor, constant: 10).isActive = true
    cardViewHeightConstraint = cardView.heightAnchor.constraint(equalToConstant: 190)
    cardViewHeightConstraint.isActive = true
    cardView.customSwitch.isLocked = true
    cardViewHeightConstraint.constant = 60
    self.cardView.nameBgView.alpha = 0
    self.cardView.nameLabel.alpha  = 0
    self.cardView.moreButton.alpha = 0
    self.cardView.showShadow(bShodow: false)
    //lockCardView()
  }
  
  func addServiceView() {
    
    let services = [ServiceModel(service: "Add\nMoney", bgColour: "008DB0", colorOpacity: 0.18, image: "addmoney1", type: .kAddMoney),
                    ServiceModel(service: "Move\nMoney", bgColour: "184AB6", colorOpacity: 0.15, image: "movemoney1", type: .kMoveMoney),
                    ServiceModel(service: "Account\n& Card", bgColour: "A216AE", colorOpacity: 0.2, image: "creditcard", type: .kCreditCard),
                    ServiceModel(service: "Lock\nCard", bgColour: "EB692E", colorOpacity: 0.15, image: "lockservice", type: .kLockCard),
                    ServiceModel(service: "Find\nATMs", bgColour: "CE8019", colorOpacity: 0.15, image: "findatm", type: .kFindATMs),
                    ServiceModel(service: "Card\nSecurity", bgColour: "26A83F", colorOpacity: 0.15, image: "cardsecurity", type: .kSecurity),
                    ServiceModel(service: "Statements\n& Docs", bgColour: "C43442", colorOpacity: 0.15, image: "documentpage", type: .kDocs),
                    ServiceModel(service: "Savings\nGoals", bgColour: "4D31BE", colorOpacity: 0.15, image: "goals", type: .kSavingGoals)]
    
    let serviceViewModel = ServiceViewModel(service: services)
    serviceView = ServiceView.init(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 60), service: serviceViewModel)
    self.addSubview(serviceView)
    serviceView.backgroundColor = .white
    serviceView.translatesAutoresizingMaskIntoConstraints = false
    serviceView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    serviceView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    serviceView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 0).isActive = true
    serviceView.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  private func addTransactionView() {
    let transactions = DataProvider().getTransactions()
    transactionView = TransactionView(transactionsViewModel: TransactionViewModel(transactionModel: transactions))    
    self.addSubview(transactionView)
    transactionView.enableScrolling(bEnable: false)
    transactionView.translatesAutoresizingMaskIntoConstraints = false
    transactionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    transactionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    transactionView.topAnchor.constraint(equalTo: serviceView.bottomAnchor, constant: 15).isActive = true
    transactionView.heightAnchor.constraint(equalToConstant: 310).isActive = true    
    transactionView.showViewALlButton()
  }
  
  private func addGoalView() {
    let goalModel = DataProvider().getGoals()
    goalView = GoalView(goalViewModel: GoalsViewModel(goals: goalModel))
    self.addSubview(goalView)
    goalView.enableScrolling(bEnable:true)
    goalView.translatesAutoresizingMaskIntoConstraints = false
    goalView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    goalView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    goalView.topAnchor.constraint(equalTo: transactionView.bottomAnchor, constant: 15).isActive = true
    goalView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    
    goalView.showViewALlButton()    
    self.layoutIfNeeded()
  }
  
  private func addPaymentView() {
    let payments = DataProvider().getScheduledPayments()
    scheduledPaymentView = ScheduledPaymentView(paymentViewModel: PaymentViewModel(payments: payments))
    self.addSubview(scheduledPaymentView)
    scheduledPaymentView.enableScrolling(bEnable: false)
    scheduledPaymentView.translatesAutoresizingMaskIntoConstraints = false
    scheduledPaymentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    scheduledPaymentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    scheduledPaymentView.topAnchor.constraint(equalTo: goalView.bottomAnchor, constant: 15).isActive = true
    scheduledPaymentView.heightAnchor.constraint(equalToConstant: 260).isActive = true
    
    scheduledPaymentView.showViewALlButton()
  }
  
  private func addSpendAnalysisView() {
    spendAnalysisView = SpendAnalysisView(spendViewModel: SpendViewModel())
    self.addSubview(spendAnalysisView)
    spendAnalysisView.translatesAutoresizingMaskIntoConstraints = false
    spendAnalysisView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    spendAnalysisView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    spendAnalysisView.topAnchor.constraint(equalTo: scheduledPaymentView.bottomAnchor, constant: 15).isActive = true
    spendAnalysisView.heightAnchor.constraint(equalToConstant: 310).isActive = true
    spendAnalysisView.showViewALlButton()
  }
  
  private func addCouponsView() {
    couponsView = CouponsView(couponViewModel: CouponViewModel())
    self.addSubview(couponsView)
    couponsView.translatesAutoresizingMaskIntoConstraints = false
    couponsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    couponsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    couponsView.topAnchor.constraint(equalTo: spendAnalysisView.bottomAnchor, constant: 15).isActive = true
    couponsView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    couponsView.showViewALlButton()
  }
  
  
  func lockCardView() {
    cardViewHeightConstraint.constant = 60
    self.cardView.customSwitch.isLocked = true
    Helper.upDateVirtualCardStatus(bLockedStatus: cardView.customSwitch.isLocked)
    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut) {
      self.layoutIfNeeded()
      self.cardView.nameBgView.alpha = 0
      self.cardView.nameLabel.alpha  = 0
      self.cardView.moreButton.alpha = 0
      self.cardView.showShadow(bShodow: false)
      self.cardView.customSwitch.updateSwitch()
    } completion: { _ in
    }
  }
  
  func unLockCardView() {
    cardViewHeightConstraint.constant = 190
    self.cardView.customSwitch.isLocked = false
    Helper.upDateVirtualCardStatus(bLockedStatus: cardView.customSwitch.isLocked)
    
    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut) {
      self.layoutIfNeeded()
      self.cardView.nameBgView.alpha = 1
      self.cardView.nameLabel.alpha  = 1
      self.cardView.moreButton.alpha = 1
      self.cardView.showShadow(bShodow: true)
      self.cardView.customSwitch.updateSwitch()
    } completion: { _ in
    }
  }
}
