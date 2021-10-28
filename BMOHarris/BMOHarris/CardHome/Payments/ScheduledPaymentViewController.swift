//
//  ScheduledPaymentViewController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/10/21.
//

import UIKit

class ScheduledPaymentViewController: UIViewController {

  var scheduledPaymentView: ScheduledPaymentView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addScheduledPaymentView()
      view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
  
  override func loadView() {
    super.loadView()
  }
  
  private func addScheduledPaymentView() {
    let payments = DataProvider().getScheduledPayments()
    scheduledPaymentView = ScheduledPaymentView(paymentViewModel: PaymentViewModel(payments: payments))
    view.addSubview(scheduledPaymentView)
    scheduledPaymentView.enableScrolling(bEnable: false)
    scheduledPaymentView.translatesAutoresizingMaskIntoConstraints = false
    scheduledPaymentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    scheduledPaymentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    scheduledPaymentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
    scheduledPaymentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    scheduledPaymentView.showViewALlButton()
  }
}
