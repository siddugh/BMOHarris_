//
//  SavingGoalsViewController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 26/10/21.
//

import UIKit

class SavingGoalsViewController: UIViewController {

  var goalsCollectionsView:UICollectionView!
  var goals:[[GoalModel]] = [[GoalModel]]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
      setupUI()
    }
  
  override func loadView() {
    super.loadView()
  }
  
  
  private func setupUI() {
    addGoals()
    addHeaderView()
    addNewGoal()
    addGoalsView()
  }
  private func addHeaderView() {
    let headerView = ViewFactory().getSavingGoalHeaderView()
    self.view.addSubview(headerView)
    headerView.translatesAutoresizingMaskIntoConstraints = false
    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    headerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    headerView.delegate = self
  }
  
  func addNewGoal() {
    let addButton = UIButton()
    addButton.setImage(UIImage(named: "addbutton")!, for: .normal)
    view.addSubview(addButton)
    addButton.addTarget(self, action: #selector(addnewGoal), for: .touchUpInside)
    addButton.translatesAutoresizingMaskIntoConstraints = false
    addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
    
    let lbl = UILabel()
    view.addSubview(lbl)
    lbl.text = "Start a New Goal"
    lbl.textColor = .black
    lbl.font = UIFont(name: "Rubik-Medium", size: 14)
    lbl.textColor = UIColor(hexString: "187ADC")
    
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 10).isActive = true
    lbl.centerYAnchor.constraint(equalTo: addButton.centerYAnchor, constant: 0).isActive = true
    
    let generalSavingsView = UIView()
    view.addSubview(generalSavingsView)
    generalSavingsView.backgroundColor = .white
    generalSavingsView.layer.shadowOffset = CGSize(width: 0, height: 1)
    generalSavingsView.layer.shadowRadius = 0.8
    generalSavingsView.layer.shadowOpacity = 0.4
    
    generalSavingsView.layer.cornerRadius = 15
    generalSavingsView.backgroundColor = .white
    
    generalSavingsView.translatesAutoresizingMaskIntoConstraints = false
    generalSavingsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    generalSavingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    generalSavingsView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20).isActive = true
    generalSavingsView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
    let savingsLabel = UILabel()
    generalSavingsView.addSubview(savingsLabel)
    savingsLabel.textAlignment = .left
    savingsLabel.text = "General Savings"
    savingsLabel.textColor = .black
    savingsLabel.font = UIFont(name: "Rubik-Medium", size: 14)
    savingsLabel.translatesAutoresizingMaskIntoConstraints = false
    savingsLabel.leadingAnchor.constraint(equalTo: generalSavingsView.leadingAnchor, constant: 15).isActive = true
    savingsLabel.centerYAnchor.constraint(equalTo: generalSavingsView.centerYAnchor, constant: 0).isActive = true

    let sAmountLabel = UILabel()
    generalSavingsView.addSubview(sAmountLabel)
    sAmountLabel.text = "$500"
    sAmountLabel.textColor = .black
    sAmountLabel.font = UIFont(name: "Rubik-Regular", size: 18)
    sAmountLabel.translatesAutoresizingMaskIntoConstraints = false
    sAmountLabel.textAlignment = .left
    sAmountLabel.trailingAnchor.constraint(equalTo: generalSavingsView.trailingAnchor, constant: -20).isActive = true
    sAmountLabel.centerYAnchor.constraint(equalTo: generalSavingsView.centerYAnchor, constant: 0).isActive = true

  }
  
  @objc func addnewGoal() {
    let controller = NewGoalViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  func addGoals() {
    
    goals.append([
      GoalModel(goal: "Emergency Fund", category: "Saver", nextPayment: "Next payment:3 0 May", nextPaymentAmount: "$100", totalSavings: "$1500", payedInstalments: 3,categoryColor: "FFC6C6",colorOpacity: 1.0,completedOn: ""),
      GoalModel(goal: "Spanish Holiday", category: "Vacation", nextPayment: "Next payment: 30 May", nextPaymentAmount: "$1200", totalSavings: "$2500", payedInstalments: 3,categoryColor: "BFF0FF",colorOpacity: 1.0,completedOn: "")
    ])
    goals.append([
      GoalModel(goal: "Buying a DSLR Camera", category: "Hobby", nextPayment: "", nextPaymentAmount: "", totalSavings: "$1000", payedInstalments: 6,categoryColor: "D9FBD9",colorOpacity: 1.0,completedOn: "Completed on: 30 Apr 2021"),
    ])
  }
  
  func addGoalsView() {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: view.bounds.size.width, height: 70)
    layout.scrollDirection = .vertical
    
    layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 20, right: 0);
    
    goalsCollectionsView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    view.addSubview(goalsCollectionsView)
    
    goalsCollectionsView.translatesAutoresizingMaskIntoConstraints = false
    goalsCollectionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    goalsCollectionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    goalsCollectionsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    goalsCollectionsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    
    goalsCollectionsView.backgroundColor = .white
    goalsCollectionsView.delegate = self
    goalsCollectionsView.dataSource = self
    goalsCollectionsView.showsVerticalScrollIndicator = false
    
    goalsCollectionsView.register(GoalCell.nib, forCellWithReuseIdentifier: GoalCell.reuseIdentifier)
    goalsCollectionsView.register(GoalsHeaderVIew.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:GoalsHeaderVIew.identifier )
  }
}



extension SavingGoalsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return goals[section].count
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return goals.count
  }
      
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalCell.reuseIdentifier, for: indexPath) as! GoalCell
    let goal = goals[indexPath.section]
    //cell.removeShadow()
    //cell.configureCell(goalModel: goal[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: collectionView.bounds.width, height: 150)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GoalsHeaderVIew.identifier, for: indexPath) as! GoalsHeaderVIew
    
    if indexPath.section == 0 {
      headerCell.titleLabel.text = "Active Goals"
    }
    
    if indexPath.section == 1 {
      headerCell.titleLabel.text = "Completed Goals"
    }

        return headerCell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      referenceSizeForHeaderInSection section: Int) -> CGSize {

      return CGSize(width: collectionView.bounds.width, height: 35)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Selected Section \(indexPath.section)")
    
    if indexPath.section == 1 {
      let controller = DepositGoalAmountViewController()
      self.navigationController?.pushViewController(controller, animated: true)
    }
  }
  
}

extension SavingGoalsViewController: HeaderDelegate {
  func backACtion() {
    navigationController?.popViewController(animated: true)
  }
}
