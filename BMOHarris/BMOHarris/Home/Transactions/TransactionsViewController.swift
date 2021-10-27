//
//  TransactionsViewController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 26/10/21.
//

import UIKit

class TransactionsViewController: UIViewController {

    var transactionsViewModel: TransactionViewModel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = .white
      setupUI()
        // Do any additional setup after loading the view.
    }

  override func loadView() {
    super.loadView()
  }
  
  init(transactionsViewModel: TransactionViewModel) {
    super.init(nibName: nil, bundle: nil)
    self.transactionsViewModel = transactionsViewModel
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setupUI() {
    let transactionView = TransactionView(transactionsViewModel: transactionsViewModel)
    self.view.addSubview(transactionView)
    transactionView.enableScrolling(bEnable: false)
    transactionView.translatesAutoresizingMaskIntoConstraints = false
    transactionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
    transactionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
    transactionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
    transactionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    transactionView.enableScrolling(bEnable: true)
  }
  
  func enableSrolling() {
    
  }
    
}
