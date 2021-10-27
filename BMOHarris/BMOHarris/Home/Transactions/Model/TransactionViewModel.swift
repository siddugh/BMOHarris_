//
//  TransactionViewModel.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 24/09/21.
//

import Foundation

class TransactionViewModel {
 
  var transactions: [TransactionModel] = [TransactionModel]()
  
  init() {
    
  }
  
  init(transactionModel: [TransactionModel]) {
    self.transactions = transactionModel
  }
}
