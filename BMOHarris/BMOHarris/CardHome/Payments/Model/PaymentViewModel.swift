//
//  PaymentViewModel.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import Foundation


class PaymentViewModel {
  
  var payments: [PaymentModel] = [PaymentModel]()
  init() {
    
  }
  
  init(payments: [PaymentModel]) {
    self.payments = payments
  }
}
