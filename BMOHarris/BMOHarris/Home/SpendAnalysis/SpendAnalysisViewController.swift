//
//  SpendAnalysisViewController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/10/21.
//

import UIKit

class SpendAnalysisViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
        setupUI()
        // Do any additional setup after loading the view.
    }
  
  override func loadView() {
    super.loadView()
  }
  
  private func setupUI() {
    let spendAnalysisView = SpendAnalysisView(spendViewModel: SpendViewModel())
    view.addSubview(spendAnalysisView)
    spendAnalysisView.translatesAutoresizingMaskIntoConstraints = false
    spendAnalysisView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    spendAnalysisView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    spendAnalysisView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
    spendAnalysisView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
}
