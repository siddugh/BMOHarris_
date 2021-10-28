//
//  ViewController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 13/09/21.
//

import UIKit

class ViewController: UIViewController {

  var accContainerView: AccountsContainer!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    //self.perform(#selector(addAccountContainer), with: nil, afterDelay: 0.5)
    //addCardView()
    //addServiceView()
    //addTransctionView()
    //addGoals()
    //addPayment()
    //addCouponView()
    //spendAnalysisView()
    //addPhysicalCardView()
    //addPhysicalCardView1()
    //addAccountSummary()
    //addNewGoalView()
    addHomeViewController()
  }
  
  func addHomeViewController() {
    Helper.upDatePhysicalCardStatus(bLockedStatus: true)
    Helper.upDateVirtualCardStatus(bLockedStatus: true)
    
    let hVC = CardHomeViewController()
    let navC = UINavigationController(rootViewController: hVC)
    navC.setNavigationBarHidden(true, animated: false)
    self.addChild(navC)
    self.view.addSubview(navC.view)
    navC.view.frame = view.bounds
    navC.didMove(toParent: self)
  }
  
  
  func addNewGoalView() {
    
    let newgoalView = UINib(nibName: "NewGoalView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! NewGoalView
    view.addSubview(newgoalView)
    newgoalView.frame = view.bounds
    
  }
  
  func addAccountSummary() {
    let accsummary =  AccountSummary(frame: CGRect(x: 0, y: 200, width: self.view.bounds.width, height: 55), type: .kChecking)
    accsummary.backgroundColor = .white
    view.addSubview(accsummary)
    //accsummary.backgroundColor = .brown
    accsummary.layer.cornerRadius = 15
    accsummary.layer.shadowOffset = .zero
    accsummary.layer.shadowOpacity = 0.5
    accsummary.layer.shadowRadius  = 6.0    
  }
  
  func addPhysicalCardView() {
    //let controller  = PhysicalCardViewController()
    //self.navigationController?.present(controller, animated: true, completion: nil)
  }
  
  func addPhysicalCardView1() {
    let physicalCardView = UINib(nibName: "PhysicalCardView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! PhysicalCardView
    physicalCardView.frame = view.bounds
    view.addSubview(physicalCardView)
  }

  
  func spendAnalysisView() {
    //let spView = SpendAnalysis(frame: CGRect(x: 15, y: 200, width: self.view.bounds.width - 30, height: 45))
    let spView = SpendAnalysis(frame: CGRect(x: 15, y: 200, width: self.view.bounds.width - 30, height: 45), catagories: [])
    self.view.addSubview(spView)
  }
  
  
  func addCouponView() {
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal
    
    let goalsView = CouponCollectionView(frame: CGRect(x: 15, y: 100, width: self.view.bounds.width - 60, height: 150), collectionViewLayout: layout)
    view.addSubview(goalsView)

  }

  func addPayment() {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    //layout.scrollDirection = .horizontal
    layout.scrollDirection = .vertical
    
    //let goalsView = GoalsCollectionView(frame: CGRect(x: 15, y: 100, width: self.view.bounds.width - 30, height: 150), collectionViewLayout: layout)
    let paymentView = PaymentCollectionView(frame: CGRect(x: 15, y: 100, width: self.view.bounds.width - 30, height: self.view.bounds.height - 100), collectionViewLayout: layout)
    view.addSubview(paymentView)

  }
  
  

  
  
  func addGoals() {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    //layout.scrollDirection = .horizontal
    layout.scrollDirection = .vertical
    
    //let goalsView = GoalsCollectionView(frame: CGRect(x: 15, y: 100, width: self.view.bounds.width - 30, height: 150), collectionViewLayout: layout)
    let goalsView = GoalsCollectionView(frame: CGRect(x: 15, y: 100, width: self.view.bounds.width - 30, height: self.view.bounds.height - 100), collectionViewLayout: layout)
    
    view.addSubview(goalsView)

  }
  
  func addTransctionView() {
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical
    
    let transactionViwe = TransactionCollectionView(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height - 100), collectionViewLayout: layout)
    view.addSubview(transactionViwe)
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
    let serviceView = ServiceView.init(frame: CGRect(x: 0, y: 200, width: self.view.bounds.width, height: 200), service: serviceViewModel)
    serviceView.backgroundColor = .white
    self.view.addSubview(serviceView)
    
  }
  
  @objc func addAccountContainer() {
     accContainerView = AccountsContainer(frame: CGRect(x: 15, y: 100, width: self.view.bounds.width - 30, height: 100))
    accContainerView.accountType = .kCHECKING
    self.view.addSubview(accContainerView)
    accContainerView.showSelectedACcount(accountType: .kSAVING)
    accContainerView.enableAccountSelection()
    accContainerView.layer.cornerRadius = 15
  }
  
  @IBAction func showCheckingAccount(_ sender: Any) {
    accContainerView.showCheckingAccount()
  }

  @IBAction func showSavingAccount(_ sender: Any) {
    accContainerView.showSavingAccount()
  }

  @IBAction func showBothAccount(_ sender: Any) {
    accContainerView.showBothAccountSelected()
  }

  
  func addCardView() {
    
    if let carView = UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? CardView {
     
      view.addSubview(carView)
      carView.translatesAutoresizingMaskIntoConstraints = false
      
      carView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
      carView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
      carView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
      carView.heightAnchor.constraint(equalToConstant: 190).isActive = true
      
      carView.delegate = self
      
    }
  }
  
}

extension ViewController: CardViewDelegate {
  func onAuthenticationSuccess(bLocked: Bool) {
    
  }
  
  func onAuthenticationFailed() {
    
  }
  
  func authenticationNotAvailable() {
    
  }
  
  func switchAction() {
    
  }
}

