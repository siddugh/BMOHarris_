//
//  HomeViewController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 20/10/21.
//

import UIKit

class HomeViewController: UIViewController {

  var collectionView: UICollectionView!
  var headerView: Header!
  var lockedCardMessageView: CardLockedMessageView?
  var lockMessgHeightConstraint: NSLayoutConstraint!
  
  var homeCell: HomeCell?
  var physicalCardController = PhysicalCardViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupUI()
      self.perform(#selector(updatePhysicalMessage), with: nil, afterDelay: 0.0)
      self.perform(#selector(setDelayedDelegate), with: nil, afterDelay: 0.3)
      
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)    
  }
    
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear..")
    //updatePhysicalMessage()
  }
  
  @objc private func updatePhysicalMessage() {
    if Helper.getPhysicalCardStatus() {
      showPhysicalCardMessg(bShow: true)
    } else {
      showPhysicalCardMessg(bShow: false)
    }
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    let _ = physicalCardController.view
    addHeaderWithMenuButton()
    addLockedMessageView()
    addCollectionView()
    //addHomeView()
  }
  private func addHeaderWithMenuButton() {
    headerView = ViewFactory().getHeaderViewWithMenuButton()
    view.addSubview(headerView)
    headerView.delegate = self
    headerView.translatesAutoresizingMaskIntoConstraints = false
    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    headerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  
  private func addLockedMessageView() {
    lockedCardMessageView = ViewFactory().getCardLockedMessageView()
    lockedCardMessageView?.delegate = self
    if let messageView = lockedCardMessageView {
      view.addSubview(messageView)
      messageView.translatesAutoresizingMaskIntoConstraints = false
      messageView.translatesAutoresizingMaskIntoConstraints = false
      messageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
      messageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
      messageView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10).isActive = true
      lockMessgHeightConstraint = messageView.heightAnchor.constraint(equalToConstant: 0)
      lockMessgHeightConstraint.isActive = true
    }
  }
  
  private func addCollectionView() {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.minimumLineSpacing = 0
    flowLayout.minimumInteritemSpacing = 0
    flowLayout.itemSize = CGSize(width: view.bounds.width, height: 2000)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    collectionView.topAnchor.constraint(equalTo: lockedCardMessageView!.bottomAnchor, constant: 5).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    
    collectionView.showsVerticalScrollIndicator = false
    collectionView.register(HomeCell.self, forCellWithReuseIdentifier: "CELL")
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
    addGapGesture()
  }
  
  func addGapGesture() {
    let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
    gesture.cancelsTouchesInView = false
    collectionView.addGestureRecognizer(gesture)
  }
  
  @objc func handleTapGesture() {
    print("addGapGesture........")
    self.perform(#selector(enableSpenAnalysisView), with: nil, afterDelay: 0.1)
    homeCell?.homeView.spendAnalysisView.loadTransactionOf(category: .kClothing)
  }
  
  @objc func enableSpenAnalysisView() {
    homeCell?.homeView.spendAnalysisView.spView.showAll()
  }
  
  private func addHomeView() {
    
    let scrollView = UIScrollView()
    self.view.addSubview(scrollView)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    scrollView.topAnchor.constraint(equalTo: lockedCardMessageView!.bottomAnchor, constant: 5).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
    scrollView.clipsToBounds = true
    scrollView.contentSize = CGSize(width: self.view.bounds.width - 30, height: 2000)
    scrollView.backgroundColor = .yellow
    let homeView = HomeView(frame: view.bounds)
    scrollView.addSubview(homeView)
  }
  
    
  private func showMenu() {
    print("showMenu")
  }
  
  func showPhysicalCardMessg(bShow: Bool) {
    UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut) {
      self.lockMessgHeightConstraint.constant = bShow ? 35 : 0
      self.view.layoutIfNeeded()
    } completion: { _ in
    }
  }
  
  func showSavingGoals() {
    let controller = SavingGoalsViewController()
    navigationController?.pushViewController(controller, animated: true)
  }
  
  func showPhysicalCard() {
    
    physicalCardController.presentationController?.delegate = self

    self.present(physicalCardController, animated: true, completion: nil)
  }
  
  func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
    print("presentationControllerWillDismiss.......")
  }
  //dismissModalViewControllerAnimated
  
  override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
    print("ViewDismissed")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("viewDidDisappear....")
  }
  
  @objc func setDelayedDelegate() {
    homeCell?.homeView.cardView.delegate = self
    homeCell?.homeView.cardView.showMoreDelegate = self
    homeCell?.homeView.serviceView.delegate = self
    homeCell?.homeView.transactionView.delegate = self
    homeCell?.homeView.transactionView.selectedItem = self
    homeCell?.homeView.scheduledPaymentView.delegate = self
    homeCell?.homeView.goalView.goalsCollectionView.goalsDelegate = self
    homeCell?.homeView.spendAnalysisView.transactionCollectionView.transDelegate = self
    homeCell?.homeView.spendAnalysisView.delegate = self

  }
}



//MARK: Extensions

extension HomeViewController: HeaderDelegate {
  func backACtion() {
    showMenu()
  }
}

// Should call from routing function
extension HomeViewController: CardLockedMessageViewDelegate {
  func tappedOnMessageView() {
   print("tappedOnMessageView...")
    showPhysicalCard()
  }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! HomeCell
    homeCell = cell
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: collectionView.bounds.width, height: 2000)
  }
}

extension HomeViewController: CardViewDelegate {
  func onAuthenticationSuccess(bLocked: Bool) {
    print("onAuthenticationSuccess...")
    if bLocked {
      homeCell?.homeView.unLockCardView()
    } else {
      homeCell?.homeView.lockCardView()
    }
  }
  
  func onAuthenticationFailed() {
    print("onAuthenticationFailed...")
  }
  
  func authenticationNotAvailable() {
    print("authenticationNotAvailable...")
  }
}


extension HomeViewController: CardViewShowMoreDelegate {
  func showMore() {
    let cntroller = AccDetailViewController()
    navigationController?.present(cntroller, animated: true, completion: nil)
  }
}

extension HomeViewController: ServiceViewDelegate {
  func loadService(type: ServiceType) {
    print("selected service :\(type)")
        
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
        showPhysicalCard()
      case .kFindATMs:
        print("kFindATMs")
      case .kSecurity:
        print("kSecurity")
      case .kDocs:
        print("kDocs")
      case .kSavingGoals:
        print("kSavingGoals")
        showSavingGoals()
      }
    
  }
}


extension HomeViewController: UIAdaptivePresentationControllerDelegate {
  func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
          return true // <-prevents the modal sheet from being closed
      }
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    print("presentationControllerDidDismiss...")
    updatePhysicalMessage()
  }
}

extension HomeViewController: TransactionViewDelegate {
  func viewAll() {
    let transactions = DataProvider().getTransactions()
   let controller = TransactionsViewController(transactionsViewModel: TransactionViewModel(transactionModel: transactions))
    let nv = UINavigationController(rootViewController: controller)
    nv.setNavigationBarHidden(true, animated: false)
    navigationController?.present(nv, animated: true, completion: nil)
  }
}

extension HomeViewController: SelectedItemDelegate {
  func selectedItem(item: TransactionModel) {
    let controller = TransactionDetailViewController()
    navigationController?.pushViewController(controller, animated: true)
  }
}

extension HomeViewController: ScheduledPaymentViewDelegate {
  func showAllScheduledPayments() {
    print("Show all scheduled payments...")
    let controller = ScheduledPaymentViewController()
    navigationController?.present(controller, animated: true, completion: nil)
  }
}

extension HomeViewController: GoalsCollectionViewDelegate {
  func showDetailsOf(goal: GoalModel) {
    let controller = DepositGoalAmountViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
}

extension HomeViewController: TransactionCollectionViewDelegate {
  func selectedTransaction(transaction: TransactionModel) {
    let controller = TransactionDetailViewController()
    navigationController?.pushViewController(controller, animated: true)
  }
}

extension HomeViewController: SpendAnalysisViewDelegate {
  func showAllTransactions() {
    let controller = SpendAnalysisViewController()
    navigationController?.present(controller, animated: true, completion: nil)
  }
}


extension HomeViewController {
  func showAccountAndCard() {   
    let aacCardViewCotroller = AccountAndCardServiceController()
    navigationController?.pushViewController(aacCardViewCotroller, animated: true)
  }
}



