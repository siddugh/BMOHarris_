//
//  TransectionCollectionView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import UIKit
protocol TransactionCollectionViewDelegate: AnyObject {
  func selectedTransaction(transaction: TransactionModel)
}
class TransactionCollectionView: UICollectionView {

  var transactions: [TransactionModel]?
  weak var transDelegate: TransactionCollectionViewDelegate?
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  //Mark: - Private functions
  
  private func setupView() {
    self.delegate = self
    self.dataSource = self
    self.register(TransactionCell.nib, forCellWithReuseIdentifier: TransactionCell.reuseIdentifier)
  }
  

  func updateTransactions(transactions: [TransactionModel]) {
    self.transactions = transactions
    reloadData()
  }
  
}

extension TransactionCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return transactions?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransactionCell.reuseIdentifier, for: indexPath) as! TransactionCell
    if let transactions = self.transactions {
      cell.configure(transactions[indexPath.item], indexPath: indexPath)
    }
    return  cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: collectionView.bounds.width, height: 60)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Show Transactions Details.....")
    guard let transaction = transactions?[indexPath.item]  else { return }
    transDelegate?.selectedTransaction(transaction: transaction)
  }
  
}
