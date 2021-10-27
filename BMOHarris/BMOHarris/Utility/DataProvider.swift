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
  
  func getGoals() -> [GoalModel] {
    var goals: [GoalModel] = [GoalModel]()

    goals.append(GoalModel(goal: "Spanish Holiday", category: "Vacation", nextPayment: "Next payment: 30 Nov", nextPaymentAmount: "$1200", totalSavings: "$2500", payedInstalments: 3,categoryColor: "BFF0FF",colorOpacity: 1.0,completedOn: "")
    )

    goals.append(
      GoalModel(goal: "Emergency Fund", category: "Saver", nextPayment: "Next payment: 30 Nov", nextPaymentAmount: "$100", totalSavings: "$1500", payedInstalments: 3,categoryColor: "FFC6C6",colorOpacity: 1.0,completedOn: ""))


    return goals
  }
  
  func getAllGoalModels() -> [[GoalModel]] {
    var goals:[[GoalModel]] = [[GoalModel]]()
    
    goals.append([
      GoalModel(goal: "Emergency Fund", category: "Saver", nextPayment: "Next payment:3 0 Nov", nextPaymentAmount: "$100", totalSavings: "$1500", payedInstalments: 3,categoryColor: "FFC6C6",colorOpacity: 1.0,completedOn: ""),
      GoalModel(goal: "Spanish Holiday", category: "Vacation", nextPayment: "Next payment: 30 Nov", nextPaymentAmount: "$1200", totalSavings: "$2500", payedInstalments: 3,categoryColor: "BFF0FF",colorOpacity: 1.0,completedOn: "")
    ])
    goals.append([
      GoalModel(goal: "Buying a DSLR Camera", category: "Hobby", nextPayment: "", nextPaymentAmount: "", totalSavings: "$1000", payedInstalments: 6,categoryColor: "D9FBD9",colorOpacity: 1.0,completedOn: "Completed on: 30 Apr 2021"),
    ])
    
    return goals
  }
  
  func getScheduledPayments() -> [PaymentModel] {
    
    var payments: [PaymentModel] = [PaymentModel]()
    
    payments.append(PaymentModel(transferTo: "Auto Transfer", logoImage: "autoTransfer1", timeStamp: "Tomorrow- -Every Fri", category: "Credit", categorybgColor: "D7785D", colorOpacity: 0.15, price: "$18.05"))

    payments.append(PaymentModel(transferTo: "Savings", logoImage: "savings1", timeStamp: "Tomorrow- -Every Sat", category: "Savings",categorybgColor: "87C44C", colorOpacity: 0.15, price: "$13.25"))

    payments.append(PaymentModel(transferTo: "Netflix", logoImage: "netflix", timeStamp: "Nov 24th", category: "Subscription",categorybgColor: "5D84D7", colorOpacity: 0.15, price: "$27.50"))

    
    payments.append(PaymentModel(transferTo: "Auto Transfer", logoImage: "autoTransfer1", timeStamp: "Tomorrow- -Every Fri", category: "Credit", categorybgColor: "D7785D", colorOpacity: 0.15, price: "$18.05"))

    payments.append(PaymentModel(transferTo: "Savings", logoImage: "savings1", timeStamp: "Tomorrow- -Every Sat", category: "Savings",categorybgColor: "87C44C", colorOpacity: 0.15, price: "$13.25"))

    payments.append(PaymentModel(transferTo: "Netflix", logoImage: "netflix", timeStamp: "Nov 24th", category: "Subscription",categorybgColor: "5D84D7", colorOpacity: 0.15, price: "$27.50"))

    return payments
  }
}


/*{
  let transactoin1 = TransactionModel(
    brandLogo: "autoTransfer1",
    brandName: "Auto Transfer",
    date: "Tomorrow- -Every Fri",
    category: "Credit",
    categorybgColor: "D7785D",
    colorOpacity: 0.15,
    price: "$18.05")
  
  transactions.append(transactoin1)
  
  let transactoin2 = TransactionModel(
    brandLogo: "savings1",
    brandName: "Savings",
    date: "Tomorrow- -Every Sat",
    category: "Savings",
    categorybgColor: "87C44C",
    colorOpacity: 0.15,
    price: "$13.25")
  transactions.append(transactoin2)

  let transactoin3 = TransactionModel(
    brandLogo: "netflix",
    brandName: "Netflix",
    date: "Jun 24th",
    category: "Subscription",
    categorybgColor: "5D84D7",
    colorOpacity: 0.15,
    price: "$27.50")
  transactions.append(transactoin3)
}
 */


