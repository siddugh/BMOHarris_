//
//  MenuViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 06/05/21.
//

import UIKit

class MenuViewController: UIViewController {

  var tableView:UITableView = UITableView()
  var titleLabel:UILabel = UILabel()
  
  weak var delegate: MenuDelegate?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
        // Do any additional setup after loading the view.
      setupUI()
    }

  func setupUI() {
    
    titleLabel.text = "MENU"
    titleLabel.textColor = .black
    titleLabel.textAlignment = .center
    titleLabel.font  = UIFont(name: "Rubik-Regular", size: 16)
    view.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    
    
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100).isActive = true
    tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    
    tableView.backgroundColor = .white
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(MenuCell.nib, forCellReuseIdentifier: MenuCell.identifier)
    tableView.separatorStyle = .none
    
  }
}


extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 70
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    delegate?.showViewController(vController: HomeViewController())
  }
  
}
