//
//  HomeCell.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 20/10/21.
//

import UIKit

class HomeDateModel {
  
}
var accountsContainer: AccountsContainer!
var cardView: CardView!
var serviceView: ServiceView!
var transactionView: TransactionView!
var goalView: GoalView!
var scheduledPaymentView: ScheduledPaymentView!
var spendAnalysisView: SpendAnalysisView!
var couponsView: CouponsView!

class HomeCell: UICollectionViewCell {
  
  var homeView: CardHomeView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func setAccountContainerDelegate() {
  }


  private func setupUI() {
    homeView = CardHomeView(frame: self.bounds)
    self.addSubview(homeView)
    print("self.bounds: \(self.bounds)")
    homeView.frame = self.bounds
    homeView.backgroundColor = .white
  }
  
  
  
  
  
  func configure(_ item: HomeDateModel, indexPath: IndexPath) {
    
  }
    
}




extension HomeCell: CardViewDelegate {
  func onAuthenticationSuccess(bLocked: Bool) {
    print("onAuthenticationSuccess")
  }
  
  func onAuthenticationFailed() {
    print("onAuthenticationFailed")
  }
  
  func authenticationNotAvailable() {
    print("authenticationNotAvailable")
  }
  
  
}
