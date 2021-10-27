//
//  SpendAnalysisView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 21/10/21.
//

import UIKit

class SpendAnalysisView: UIView {

  var spendViewModel: SpendViewModel?
  var transactionCollectionView: TransactionCollectionView!
  var spView: SpendAnalysis!
  
  let viewAllButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  convenience init(spendViewModel: SpendViewModel) {
    self.init()
    self.spendViewModel = spendViewModel
    addPaymentView()
    self.backgroundColor = .white
    self.perform(#selector(showSpendAnalysis), with: nil, afterDelay: 0.0)
  }
  
  private func addPaymentView() {
    
    let labelBGView = UIView()
    self.addSubview(labelBGView)
    labelBGView.backgroundColor = UIColor(hexString: "E2E2E2")
    labelBGView.translatesAutoresizingMaskIntoConstraints = false
    labelBGView.layer.cornerRadius = 14
    
    labelBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    labelBGView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    labelBGView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    labelBGView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    let imageView = UIImageView()
    imageView.image = UIImage(named: "spend")
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
    label.text = "Spend Analysis"
    label.font = UIFont(name: "Rubik Regular", size: 12)
    label.textAlignment = .left
    
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical
        
  }
  
  
  @objc private func showSpendAnalysis() {
    print("self.bounds.width: \(self.bounds.width...)")
    spView = SpendAnalysis(frame: CGRect(x: 15, y: 60, width: self.bounds.width - 30, height: 45), catagories: [])
    self.addSubview(spView)
    spView.translatesAutoresizingMaskIntoConstraints = false
    spView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    spView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    spView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
    //spView.heightAnchor.constraint(equalToConstant: 57).isActive = true
    spView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    spView.show()
    addColletionView()
  }
  
  private func addCategoriesView() {
    
  }
  
  
  func addColletionView() {    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical
    
    transactionCollectionView = TransactionCollectionView(frame: .zero, collectionViewLayout: layout)
    self.addSubview(transactionCollectionView)

    transactionCollectionView.translatesAutoresizingMaskIntoConstraints = false
    transactionCollectionView.backgroundColor = .white
    transactionCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    transactionCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    transactionCollectionView.topAnchor.constraint(equalTo: spView.bottomAnchor, constant: 10).isActive = true
    transactionCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true

    enableScrolling(bEnable: false)
  }
  
  func enableScrolling(bEnable: Bool) {
    transactionCollectionView.isScrollEnabled = bEnable
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

  }
  
  @objc func viewAllAction() {
    print("viewAllAction...")
  }

}
