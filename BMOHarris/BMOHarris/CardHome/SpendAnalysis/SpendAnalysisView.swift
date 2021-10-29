//
//  SpendAnalysisView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 21/10/21.
//

import UIKit

protocol SpendAnalysisViewDelegate: AnyObject {
  func showAllTransactions()
}

class SpendAnalysisView: UIView {

  var spendViewModel: SpendViewModel?
  var transactionCollectionView: TransactionCollectionView!
  var spView: SpendAnalysis!
  var customSwitch: FBCustomSwitch!
  var lastMonthLabel: UILabel = UILabel()
  var thisMonthLabel: UILabel = UILabel()
  
  let clothingtransactions = DataProvider().getTransactions()
  let diningtransactions = DataProvider().getDiningTransactions()
  let utilitytransactions = DataProvider().getUtilityTransactions()
  let grocerytransactions = DataProvider().getGroceryTransactions()
  let foodtransactions = DataProvider().getFoodTransactions()
  
  weak var delegate: SpendAnalysisViewDelegate?
  
  let viewAllButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  convenience init(spendViewModel: SpendViewModel) {
    self.init()
    self.spendViewModel = spendViewModel
    addPaymentView()
    self.backgroundColor = .white
    self.perform(#selector(showSpendAnalysis), with: nil, afterDelay: 0.0)
  }
  
  private func addPaymentView() {
    
    let labelBGView = UIView()
    self.addSubview(labelBGView)
    labelBGView.backgroundColor = UIColor(hexString: "E2E2E2")
    labelBGView.translatesAutoresizingMaskIntoConstraints = false
    labelBGView.layer.cornerRadius = 14
    
    labelBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    labelBGView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    labelBGView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    labelBGView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    let imageView = UIImageView()
    imageView.image = UIImage(named: "spend")
    labelBGView.addSubview(imageView)
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.leadingAnchor.constraint(equalTo: labelBGView.leadingAnchor, constant: 15).isActive = true
    imageView.centerYAnchor.constraint(equalTo: labelBGView.centerYAnchor, constant: 0).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
    imageView.backgroundColor = .clear
    
    
    let label = UILabel()
    labelBGView.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.centerYAnchor.constraint(equalTo: labelBGView.centerYAnchor, constant: 0).isActive = true
    label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
    label.text = "Spend Analysis"
    label.font = UIFont(name: "Rubik Regular", size: 12)
    label.textAlignment = .left
    
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical
    
  }
  
  
  func addDurationlabels() {
    setMonthslabels()
    updateLabels(thisMonth: true)
  }
  
  
  func setMonthslabels() {
    
    customSwitch = FBCustomSwitch()
    self.addSubview(thisMonthLabel)
    self.addSubview(customSwitch)
    self.addSubview(lastMonthLabel)
    
    thisMonthLabel.text = "This\nMonth"
    thisMonthLabel.numberOfLines = 2
    thisMonthLabel.font = UIFont(name: "Rubik Regular", size: 10)
    thisMonthLabel.textAlignment = .right
    thisMonthLabel.translatesAutoresizingMaskIntoConstraints = false
    thisMonthLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2).isActive = true
    thisMonthLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    
    
    
    self.addSubview(customSwitch)
    customSwitch.delegate = self
    customSwitch.translatesAutoresizingMaskIntoConstraints = false
    customSwitch.trailingAnchor.constraint(equalTo: thisMonthLabel.leadingAnchor, constant: -5).isActive = true
    customSwitch.centerYAnchor.constraint(equalTo: thisMonthLabel.centerYAnchor, constant: 0).isActive = true
    customSwitch.widthAnchor.constraint(equalToConstant: 45).isActive = true
    customSwitch.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    customSwitch.containerColor = UIColor(hexString: "EDEDED")
    customSwitch.nobLockedColor = UIColor(hexString: "53C984")
    customSwitch.nobLockedColor = UIColor(hexString: "53C984")
    customSwitch.nobUnLockedColor = UIColor(hexString: "53C984")
    customSwitch.setUpView()
    
    
    lastMonthLabel.text = "Last\nMonth"
    lastMonthLabel.numberOfLines = 2
    lastMonthLabel.font = UIFont(name: "Rubik Regular", size: 10)
    thisMonthLabel.textAlignment = .left
    lastMonthLabel.translatesAutoresizingMaskIntoConstraints = false
    lastMonthLabel.trailingAnchor.constraint(equalTo: customSwitch.leadingAnchor, constant: -4).isActive = true
    lastMonthLabel.centerYAnchor.constraint(equalTo: thisMonthLabel.centerYAnchor, constant: 0).isActive = true

  }
  
  
  
  @objc private func showSpendAnalysis() {
    print("self.bounds.width: \(self.bounds.width...)")
    spView = SpendAnalysis(frame: CGRect(x: 15, y: 60, width: self.bounds.width - 30, height: 45), catagories: [])
    self.addSubview(spView)
    spView.translatesAutoresizingMaskIntoConstraints = false
    spView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
    spView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    spView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
    spView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    spView.delegate = self
    spView.transDelegate = self
    addColletionView()
  }
  
  private func addCategoriesView() {
    
  }
  
  
  func addColletionView() {    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical
        
    transactionCollectionView = TransactionCollectionView(frame: .zero, collectionViewLayout: layout)
    transactionCollectionView.updateTransactions(transactions: clothingtransactions)
    self.addSubview(transactionCollectionView)
    transactionCollectionView.translatesAutoresizingMaskIntoConstraints = false
    transactionCollectionView.backgroundColor = .white
    transactionCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    transactionCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    transactionCollectionView.topAnchor.constraint(equalTo: spView.bottomAnchor, constant: 10).isActive = true
    transactionCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true    
    loadTransactionOf(category: .kClothing)
    enableScrolling(bEnable: false)
  }
  
  func enableScrolling(bEnable: Bool) {
    transactionCollectionView.isScrollEnabled = bEnable
  }
  
  func loadTransactionOf(category: SpendCategoryType) {
    switch category {
    case .kClothing:
      transactionCollectionView.updateTransactions(transactions: clothingtransactions)
    case .kDiining:
      transactionCollectionView.updateTransactions(transactions: diningtransactions)
    case .kUtility:
      transactionCollectionView.updateTransactions(transactions: utilitytransactions)
    case .kGrocery:
      transactionCollectionView.updateTransactions(transactions: grocerytransactions)
    case .kFoodDrink:
      transactionCollectionView.updateTransactions(transactions: foodtransactions)
    }
  }
  
  func showViewALlButton() {
    let lineLabel = UILabel()
    self.addSubview(lineLabel)
    lineLabel.backgroundColor = UIColor(hexString: "D8D8D8")
    lineLabel.translatesAutoresizingMaskIntoConstraints = false
    lineLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    lineLabel.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: 0).isActive = true
    lineLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    lineLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    
    self.addSubview(viewAllButton)
    viewAllButton.setTitle("View All", for: .normal)
    viewAllButton.setTitleColor(UIColor(hexString: "3280C1"), for: .normal)
    viewAllButton.backgroundColor = .white
    viewAllButton.titleLabel?.font = UIFont(name: "Rubik Medium", size: 10)
    viewAllButton.translatesAutoresizingMaskIntoConstraints = false
    viewAllButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    viewAllButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
    viewAllButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    viewAllButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
    viewAllButton.layer.cornerRadius = 10.5
    viewAllButton.layer.borderWidth = 1
    viewAllButton.layer.borderColor = UIColor.lightGray.cgColor
    viewAllButton.layer.cornerRadius = 11
    
    viewAllButton.addTarget(self, action: #selector(viewAllAction), for: .touchUpInside)

  }
  
  @objc func viewAllAction() {
    delegate?.showAllTransactions()
  }

}


extension SpendAnalysisView: FBCustomSwitchDelegate {
  func onSwitchActionCompletion() {
  
    if self.customSwitch.isLocked {
      print("Switch Locked")
      updateLabels(thisMonth: true)
    } else {
      print("Switch UnLocked")
      updateLabels(thisMonth: false)
    }
  }
  
  func switchAction() {
    self.customSwitch.switchAction()
  }
  
  func updateLabels(thisMonth: Bool) {
    if thisMonth {
      UIView.animate(withDuration: 0.5) {
        //self.lastMonthLabel.alpha = 1
        //self.thisMonthLabel.alpha = 1

        self.lastMonthLabel.textColor = .black
        self.thisMonthLabel.textColor = UIColor(hexString: "B3B3B3")
      }
      
    } else {
      
      UIView.animate(withDuration: 0.5) {
        //self.lastMonthLabel.alpha = 1
        //self.thisMonthLabel.alpha = 1

        self.lastMonthLabel.textColor = UIColor(hexString: "B3B3B3")
        self.thisMonthLabel.textColor = .black
      }
    }
  }
}


extension SpendAnalysisView: SelectedCategory {
  func selectedCatogry(cattagory: SpendCategoryType) {
    print("Selected Category: \(cattagory)")
  }
}

extension SpendAnalysisView: SpendAnalysisDelegate {
  func showTransactionListOf(category: SpendCategoryType) {
    print("Inside SpendAnalysisView : Selected Category.... \(category)")
    loadTransactionOf(category: category)
  }
}
