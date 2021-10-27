//
//  DataProvider.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/10/21.
//

import Foundation


class DataProvider {
  
  func getTransactions() -> [TransactionModel] {
   
    var transactions = [TransactionModel]()
    let transactoin1 = TransactionModel(
      brandLogo: "wholefoods",
      brandName: "Whole Foods",
      date: "Jun  05   18:32",
      category: "Food",
      categorybgColor: "D7785D",
      colorOpacity: 0.15,
      price: "$18.05")
    transactions.append(transactoin1)
    
    let transactoin2 = TransactionModel(
      brandLogo: "cvshealth",
      brandName: "CVS",
      date: "Jun  05   18:32",
      category: "Health",
      categorybgColor: "87C44C",
      colorOpacity: 0.15,
      price: "$13.25")
    transactions.append(transactoin2)
    
    let transactoin3 = TransactionModel(
      brandLogo: "mcdonalds",
      brandName: "McDonalds",
      date: "Jun  05   18:32",
      category: "Food",
      categorybgColor: "D7785D",
      colorOpacity: 0.15,
      price: "$8.50")
    transactions.append(transactoin3)

    let transactoin4 = TransactionModel(
      brandLogo: "nikestore",
      brandName: "Nike Store",
      date: "Jun  05   18:32",
      category: "Clothing",
      categorybgColor: "5D84D7",
      colorOpacity: 0.15,
      price: "$27.50")
    transactions.append(transactoin4)
    
    transactions.append(transactoin1)
    transactions.append(transactoin2)
    transactions.append(transactoin3)
    transactions.append(transactoin4)
    
    return transactions
  }
}
