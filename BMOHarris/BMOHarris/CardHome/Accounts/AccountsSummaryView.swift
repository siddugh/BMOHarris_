//
//  AccountsSummaryView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 25/10/21.
//

import UIKit

protocol AccountsSummaryViewDelegate: AnyObject {
  func showAllTransactions()
  func showGoalDetails()
  func showTransactionsDetails()
}

class AccountsSummaryView: UIView {
 
  let searchView = UIView()
  var transactionView:  TransactionView!
  weak var delegate: AccountsSummaryViewDelegate?
  
  var checkingAccummary:AccountSummary!
  var checkingAccHeightConstraint: NSLayoutConstraint!
  
  
  var savAccummary:AccountSummary!
  var savAccHeightConstraint: NSLayoutConstraint!
  var goalCollectionView: GoalsCollectionView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  convenience init(type: AccountType) {
    self.init(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
    self.backgroundColor = .green
    switch type {
    case .kCHECKING:
      print("...")
      self.perform(#selector(addCheckingAccountSummary), with: nil, afterDelay: 0.1)
    case .kSAVING:
      self.perform(#selector(addSavingAccountSummary), with: nil, afterDelay: 0.1)
    case .kBOTH:
      print("both")
    }    
  }
  
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
    
  // Need Rework
  @objc private func addCheckingAccountSummary() {
    checkingAccummary =  AccountSummary(frame: CGRect(x: 1, y: 1, width: self.bounds.width - 2, height: 55), type: .kChecking)
    self.addSubview(checkingAccummary)
    checkingAccummary.backgroundColor = .white
    checkingAccummary.layer.cornerRadius = 15
    checkingAccummary.layer.shadowOffset = .zero
    checkingAccummary.layer.shadowOpacity = 0.3
    checkingAccummary.layer.shadowRadius  = 1.0
    //checkingAccummary.clipsToBounds = true
    
    checkingAccummary.translatesAutoresizingMaskIntoConstraints = false
    checkingAccummary.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 1).isActive = true
    checkingAccummary.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2).isActive = true
    checkingAccummary.topAnchor.constraint(equalTo: self.topAnchor, constant: -1).isActive = true
    checkingAccHeightConstraint =  checkingAccummary.heightAnchor.constraint(equalToConstant: 55)
    checkingAccHeightConstraint.isActive = true
    
    
    
    
        
    self.addSubview(searchView)
    searchView.frame = CGRect(x: 0, y: 70, width: self.bounds.width, height: 50)
    searchView.translatesAutoresizingMaskIntoConstraints = false
    searchView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 1).isActive = true
    searchView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -1).isActive = true
    searchView.topAnchor.constraint(equalTo: checkingAccummary.bottomAnchor, constant: 15).isActive = true
    searchView.heightAnchor.constraint(equalToConstant: 50).isActive  = true
        
    searchView.backgroundColor = .white
    searchView.layer.cornerRadius = 10
    searchView.layer.shadowOffset = .zero
    searchView.layer.shadowRadius = 1
    searchView.layer.shadowOpacity = 0.3


    let searchLabel = UILabel()
    searchLabel.text = "Search"
    searchLabel.frame = CGRect(x: 15, y: 15, width: 100, height: 20)
    searchView.addSubview(searchLabel)
    searchLabel.font = UIFont(name: "Rubik Regular", size: 12)
    
    let searchImage = UIImageView()
    searchImage.image = UIImage(named: "search")
    searchImage.frame = CGRect(x: searchView.bounds.width - 30, y: 15, width: 15, height: 15)
    searchView.addSubview(searchImage)
    
    
    let stackViewContainer  = UIView()
    self.addSubview(stackViewContainer)
    stackViewContainer.translatesAutoresizingMaskIntoConstraints = false
    stackViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    stackViewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    stackViewContainer.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 15).isActive = true
    stackViewContainer.heightAnchor.constraint(equalToConstant: 25).isActive = true
    stackViewContainer.backgroundColor = .white

    
//    let stackView = UIStackView()
//    stackViewContainer.addSubview(stackView)
//
//    stackView.alignment = .center
//    stackView.distribution = .fillEqually
//
//    stackView.spacing = 10
//    stackView.axis = .horizontal
//
//
//    stackView.translatesAutoresizingMaskIntoConstraints = false
//    stackView.leadingAnchor.constraint(equalTo: stackViewContainer.leadingAnchor, constant: 0).isActive = true
//    stackView.trailingAnchor.constraint(equalTo: stackViewContainer.trailingAnchor, constant: 5).isActive = true
//    stackView.topAnchor.constraint(equalTo: stackViewContainer.topAnchor, constant: 0).isActive = true
//    stackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
//    stackView.backgroundColor = .white
    
    
    let hStackView = UIStackView()
    hStackView.alignment = .leading
    hStackView.distribution = .fillEqually
    hStackView.axis = .horizontal
    self.addSubview(hStackView)
    
    hStackView.translatesAutoresizingMaskIntoConstraints = false
    hStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    hStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    hStackView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 25).isActive = true
    //hStackView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    hStackView.backgroundColor = .yellow

    
    
    
    
    
    let categories = ["Income", "Spending", "Shoping", "Food", "Health"]
    
    var xPos = 0
    for  i in 0..<categories.count {
      
      let v = UIView()
      let lblStr = categories[i]
      let font = UIFont(name: "Rubik Regular", size: 10)
      let width = lblStr.widthWithConstrainedHeight(20, font: font!)
      v.frame = CGRect(x: xPos, y: 0, width: Int(width) + 10, height: 18)
      v.layer.cornerRadius = 5
      v.backgroundColor = UIColor(hexString: "A8A8A8",alpha: 0.3)
      
      
      print("v.frame : \(v.frame)")
      
      let label = UILabel()
      label.font = font
      label.sizeToFit()
      
            
      
      label.text = lblStr
      v.addSubview(label)
      
      label.translatesAutoresizingMaskIntoConstraints = false
      
      //label.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 2).isActive = true
      label.centerYAnchor.constraint(equalTo: v.centerYAnchor, constant: 0).isActive = true
      label.centerXAnchor.constraint(equalTo: v.centerXAnchor, constant: 0).isActive = true
      
      label.backgroundColor = .clear
      print("labelwidth: \(width)")
      
      stackViewContainer.addSubview(v)
      //hStackView.addArrangedSubview(v)
      
      xPos += 68
    }
    
    addCheckingTapGesture()
    
    addTransactionView()
            
  }
  
  private func addCheckingTapGesture() {
    checkingAccummary.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCheckAccTapGesture)))
  }

  @objc func handleCheckAccTapGesture() {
    checkingAccummary.showSummary()
    self.checkingAccHeightConstraint.constant = !self.checkingAccummary.isShowingSummary ? 208 : 55
    UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
      self.layoutIfNeeded()
    } completion: { _ in
    }
  }
  
  private func addTransactionView() {
    let transactions = DataProvider().getTransactions()
    transactionView = TransactionView(transactionsViewModel: TransactionViewModel(transactionModel: transactions))
    self.addSubview(transactionView)
    transactionView.enableScrolling(bEnable: false)
    transactionView.translatesAutoresizingMaskIntoConstraints = false
    transactionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    transactionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    transactionView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 55).isActive = true
    transactionView.heightAnchor.constraint(equalToConstant: 310).isActive = true
    
    transactionView.showViewALlButton()
    transactionView.delegate = self
    transactionView.selectedItem = self
  }
  
  
  @objc private func addSavingAccountSummary() {
    savAccummary =  AccountSummary(frame: CGRect(x: 1, y: 1, width: self.bounds.width - 2, height: 100), type: .kSaving)
    self.addSubview(savAccummary)
    savAccummary.backgroundColor = .white
    savAccummary.layer.cornerRadius = 15
    savAccummary.layer.shadowOffset = .zero
    savAccummary.layer.shadowOpacity = 0.3
    savAccummary.layer.shadowRadius  = 1.0
    
    savAccummary.translatesAutoresizingMaskIntoConstraints = false
    savAccummary.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 1).isActive = true
    savAccummary.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -1).isActive = true
    savAccummary.topAnchor.constraint(equalTo: self.topAnchor, constant: -1).isActive = true
    savAccHeightConstraint =  savAccummary.heightAnchor.constraint(equalToConstant: 100)
    savAccHeightConstraint.isActive = true
    
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: 1000, height: 1000)
    layout.scrollDirection = .horizontal
    goalCollectionView = GoalsCollectionView(frame: CGRect(x: 0, y: 65 , width: self.bounds.width, height: 150), collectionViewLayout: layout)
    self.addSubview(goalCollectionView)

    goalCollectionView.translatesAutoresizingMaskIntoConstraints = false
    goalCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    goalCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    goalCollectionView.topAnchor.constraint(equalTo: savAccummary.bottomAnchor, constant: 10).isActive = true
    goalCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true

    goalCollectionView.backgroundColor = .white
    goalCollectionView.goalsDelegate = self

    let goals = DataProvider().getGoals()
    goalCollectionView.loadGoals(goals: goals)

    let scheduledSavView = ScheduledSavingsView(goalsViewModel: GoalsViewModel(goals: goals))
    self.addSubview(scheduledSavView)
    scheduledSavView.frame = CGRect(x: 0, y: 225, width: self.bounds.width, height: 200)
    scheduledSavView.enableScrolling(bEnable: false)
    scheduledSavView.showViewALlButton()

    scheduledSavView.translatesAutoresizingMaskIntoConstraints = false
    scheduledSavView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    scheduledSavView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    scheduledSavView.topAnchor.constraint(equalTo: goalCollectionView.bottomAnchor, constant: 10).isActive = true
    scheduledSavView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    
    addTapGesture()
  }
  
  private func addTapGesture() {
    savAccummary.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
  }

  @objc func handleTapGesture() {
    savAccummary.showSummary()
    self.savAccHeightConstraint.constant = !self.savAccummary.isShowingSummary ? 440 : 100
    UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
      self.layoutIfNeeded()
    } completion: { _ in
    }

  }
    
  
  private func addSearView() {
    
  }

}



extension AccountsSummaryView: TransactionViewDelegate {
  func viewAll() {
    delegate?.showAllTransactions()
  }
}

extension String{
    func widthWithConstrainedHeight(_ height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)

      let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}


extension AccountsSummaryView: GoalsCollectionViewDelegate {
  func showDetailsOf(goal: GoalModel) {
    delegate?.showGoalDetails()
  }
}


extension AccountsSummaryView: SelectedItemDelegate {
  func selectedItem(item: TransactionModel) {
    delegate?.showTransactionsDetails()
  }
}
