//
//  TransactionView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 20/10/21.
//

import UIKit


protocol TransactionViewDelegate: AnyObject {
  func viewAll()
}

protocol SelectedItemDelegate: AnyObject {
  func selectedItem(item: TransactionModel)
}

class TransactionView: UIView {

  var transactionsViewModel: TransactionViewModel?
  var transactionCollectionView: TransactionCollectionView!
  weak var delegate: TransactionViewDelegate?
  weak var selectedItem: SelectedItemDelegate?
  
  let viewAllButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  convenience init(transactionsViewModel: TransactionViewModel) {
    self.init()
    self.transactionsViewModel = transactionsViewModel
    addTransactionView()
    //self.perform(#selector(addTransactionView), with: nil, afterDelay: 0.0)
    
    self.backgroundColor = .white
    
    //loadData(transactions: transactionsViewModel.transactions)
    self.layoutIfNeeded()
  }
  
  
  @objc private func addTransactionView() {
    
    let labelBGView = UIView()
    self.addSubview(labelBGView)
    labelBGView.backgroundColor = UIColor(hexString: "E2E2E2")
    labelBGView.translatesAutoresizingMaskIntoConstraints = false
    labelBGView.layer.cornerRadius = 14
    
    labelBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    labelBGView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    labelBGView.widthAnchor.constraint(equalToConstant: 220).isActive = true
    labelBGView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    let imageView = UIImageView()
    imageView.image = UIImage(named: "invoice")
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
    label.text = "Recent Saving Transactions"
    label.font = UIFont(name: "Rubik Regular", size: 12)
    label.textAlignment = .left
    
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical
    
    transactionCollectionView = TransactionCollectionView(frame: .zero, collectionViewLayout: layout)
    self.addSubview(transactionCollectionView)
    transactionCollectionView.showsVerticalScrollIndicator = false

    transactionCollectionView.translatesAutoresizingMaskIntoConstraints = false
    transactionCollectionView.backgroundColor = .white
    transactionCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    transactionCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    transactionCollectionView.topAnchor.constraint(equalTo: labelBGView.bottomAnchor, constant: 10).isActive = true
    transactionCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
    transactionCollectionView.transDelegate = self
    //self.transactionsViewModel
    
    if let transactions = transactionsViewModel?.transactions {
      loadData(transactions: transactions)
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
    
    self.layoutIfNeeded()

  }
  
  func loadData(transactions: [TransactionModel]) {
    if transactionCollectionView != nil {
      transactionCollectionView.updateTransactions(transactions: transactions)
    }
  }
  
  @objc func viewAllAction() {
    delegate?.viewAll()
  }
    
  func enableScrolling(bEnable: Bool) {
    if transactionCollectionView != nil {
      transactionCollectionView.isScrollEnabled = bEnable
    }
  }
  
}


extension TransactionView: TransactionCollectionViewDelegate {
  func selectedTransaction(transaction: TransactionModel) {
    selectedItem?.selectedItem(item: transaction)
  }
}
