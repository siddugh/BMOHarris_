//
//  TransactionDetailViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 05/05/21.
//

import UIKit

class TransactionDetailViewController: UIViewController {

  
  var tableView: UITableView = UITableView()
  let titlegb = UIView()
  var headerView: Header!
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
    //setupUI()
    
    addHeaderView()
    addTableView()
  }
  
  func setupUI() {
    
    
    view.addSubview(titlegb)
    
    let newLabel = UILabel()
    view.addSubview(newLabel)
    newLabel.text = "Transactions"
    newLabel.font = UIFont(name: "Rubik-Regular", size: 15)
    newLabel.translatesAutoresizingMaskIntoConstraints  = false
    newLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    newLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
    newLabel.textColor = .white
    
    titlegb.translatesAutoresizingMaskIntoConstraints = false
    titlegb.centerXAnchor.constraint(equalTo: newLabel.centerXAnchor, constant: 0).isActive = true
    titlegb.centerYAnchor.constraint(equalTo: newLabel.centerYAnchor, constant: 0).isActive = true
    titlegb.widthAnchor.constraint(equalTo: newLabel.widthAnchor, constant: 32).isActive = true
    titlegb.heightAnchor.constraint(equalTo: newLabel.heightAnchor, constant: 15).isActive = true
    titlegb.backgroundColor = UIColor(displayP3Red: 70/255, green: 18/255, blue: 211/255, alpha: 1)
    
    titlegb.layer.cornerRadius = 16
    
    
    
    
    let backButtonBG = UIView()
    view.addSubview(backButtonBG)
    
    let removeButton = UIButton()
    view.addSubview(removeButton)
    removeButton.setImage(UIImage(named: "leftarrow"), for: .normal)
    removeButton.frame = CGRect(x: 15, y: 55, width: 20, height: 20)
    removeButton.addTarget(self, action: #selector(moveback), for: .touchUpInside)
    
    let removeButton1 = UIButton()
    view.addSubview(removeButton1)
    removeButton1.frame = CGRect(x: 15, y: 55, width: 80, height: 40)
    removeButton1.addTarget(self, action: #selector(moveback), for: .touchUpInside)
    
    
    
    backButtonBG.frame = CGRect(x: 10, y: 50, width: 30, height: 30)
    backButtonBG.backgroundColor = UIColor(hexString: "F5F5F5")
    backButtonBG.layer.cornerRadius = 15
    
    addTableView()
  }
  
  @objc func moveback() {
    self.navigationController?.popViewController(animated: true)
  }
  
  
  func addHeaderView() {
    headerView = ViewFactory().getTransDetailHeader()
    self.view.addSubview(headerView)
    headerView.titleLabel.text = "Transactions"
    headerView.translatesAutoresizingMaskIntoConstraints = false
    headerView.delegate = self
    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    headerView.heightAnchor.constraint(equalToConstant: 55).isActive = true
    headerView.initilize()
  }

  
  func addTableView() {
    view.addSubview(tableView)
    tableView.backgroundColor = .white
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10).isActive = true
    
    tableView.backgroundColor = .white
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(TransactionDetailCell.nib, forCellReuseIdentifier: TransactionDetailCell.identifier)
    tableView.separatorStyle = .none
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension TransactionDetailViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TransactionDetailCell.identifier, for: indexPath) as! TransactionDetailCell
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return tableView.frame.size.height
  }
}



extension TransactionDetailViewController: HeaderDelegate {
  func backACtion() {
    navigationController?.popViewController(animated: true)
  }
}
