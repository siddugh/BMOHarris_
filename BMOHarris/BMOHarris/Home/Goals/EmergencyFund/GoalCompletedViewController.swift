//
//  GoalCompletedViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 01/05/21.
//

import UIKit

class GoalCompletedViewController: UIViewController {

  var tableView:UITableView = UITableView()
  let goalImageView = UIImageView()
  
  override func loadView() {
    super.loadView()
    self.view.backgroundColor = .white
    setupUI()
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  func setupUI() {
    view.backgroundColor = .white
    let imageView = UIImageView()
    view.addSubview(imageView)
    imageView.contentMode = .scaleToFill
    imageView.image = UIImage(named: "completedGoalbg")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
    
    
    view.addSubview(goalImageView)
    goalImageView.image = UIImage(named: "emergencyfund1")
    goalImageView.translatesAutoresizingMaskIntoConstraints = false
    goalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    goalImageView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -50).isActive = true
    goalImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    goalImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    view.bringSubviewToFront(goalImageView)
    goalImageView.backgroundColor = .clear
    let newLabel = UILabel()
    view.addSubview(newLabel)
    newLabel.text = "Emergency fund"
    newLabel.font = UIFont(name: "Rubik-Medium", size: 18)
    newLabel.translatesAutoresizingMaskIntoConstraints  = false
    newLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    newLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
    newLabel.textColor = .white
    
    let bgView = UIView()
    bgView.backgroundColor = UIColor(hexString: "FFFFFF", alpha:0.5)
    view.addSubview(bgView)

    
    let amountLabel = UILabel()
    let dollerLabel = UILabel()
    dollerLabel.text = "$"
    amountLabel.text = "1000"
    view.addSubview(amountLabel)
    view.addSubview(dollerLabel)
    amountLabel.font = UIFont(name: "Rubik-Medium", size: 35)
    dollerLabel.font = UIFont(name: "Rubik-Medium", size: 18)
    
    amountLabel.textAlignment = .center
    dollerLabel.textAlignment = .right
    amountLabel.textColor = .black
    dollerLabel.textColor = .black
    
    amountLabel.translatesAutoresizingMaskIntoConstraints = false
    dollerLabel.translatesAutoresizingMaskIntoConstraints = false
    
    amountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    amountLabel.topAnchor.constraint(equalTo: newLabel.bottomAnchor, constant: 10).isActive = true
    
    dollerLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: 0).isActive = true
    dollerLabel.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor, constant: 3).isActive = true
    
    bgView.translatesAutoresizingMaskIntoConstraints = false
    bgView.widthAnchor.constraint(equalTo: amountLabel.widthAnchor, constant: 40).isActive = true
    bgView.heightAnchor.constraint(equalTo: amountLabel.heightAnchor, constant: 8).isActive = true
    bgView.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor, constant: 0).isActive = true
    bgView.centerXAnchor.constraint(equalTo: amountLabel.centerXAnchor, constant: -2).isActive = true
    bgView.layer.cornerRadius = 24



    
    let totalAmount = UILabel()
    totalAmount.text = "of $1000"
    totalAmount.textColor = .black
    totalAmount.textAlignment = .center
    totalAmount.font = UIFont(name: "Rubik-Regular", size: 13)
    view.addSubview(totalAmount)
    
    
    
    
    totalAmount.translatesAutoresizingMaskIntoConstraints = false
    
    totalAmount.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    totalAmount.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 10).isActive = true
     
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
  
  func addTableView() {
    
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    tableView.topAnchor.constraint(equalTo: goalImageView.bottomAnchor, constant: 0).isActive = true
    
    tableView.backgroundColor = .white
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(GoalCompletedCell.nib, forCellReuseIdentifier: GoalCompletedCell.identifier)
    tableView.separatorStyle = .none
    tableView.showsVerticalScrollIndicator = false
    tableView.backgroundColor = .white
  }
}

extension GoalCompletedViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: GoalCompletedCell.identifier, for: indexPath) as! GoalCompletedCell
    cell.selectionStyle = .none
    //cell.reviewNewGoalVIew.delegate = self
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 450 //view.bounds.height + 270//tableView.frame.height
  }
  
 
}
