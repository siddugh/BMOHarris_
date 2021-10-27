//
//  ReviewNewgoalViewController.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 26/10/21.
//

import UIKit

class ReviewNewgoalViewController: UIViewController {
  
  //var tableView:UITableView = UITableView()
  var collectionView:UICollectionView!
  let goalImageView = UIImageView()
  override func loadView() {
    super.loadView()
    self.view.backgroundColor = .white
    
  }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
  

  func setupUI() {
    view.backgroundColor = .white
    let imageView = UIImageView()
    view.addSubview(imageView)
    imageView.contentMode = .scaleToFill
    imageView.image = UIImage(named: "newgoalbg")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 170).isActive = true
    
    
    view.addSubview(goalImageView)
    goalImageView.image = UIImage(named: "emergencyfund1")
    goalImageView.translatesAutoresizingMaskIntoConstraints = false
    goalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    goalImageView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -50).isActive = true
    goalImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    goalImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    view.bringSubviewToFront(goalImageView)
    
    let newLabel = UILabel()
    view.addSubview(newLabel)
    newLabel.text = "Review new goal"
    newLabel.font = UIFont(name: "Rubik-Medium", size: 18)
    newLabel.translatesAutoresizingMaskIntoConstraints  = false
    newLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    newLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
    newLabel.textColor = .white
    
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
    
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 1000, height: 1000)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.addSubview(collectionView)
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    collectionView.topAnchor.constraint(equalTo: goalImageView.bottomAnchor, constant: -10).isActive = true
    
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(ReviewNewGoalCell.self, forCellWithReuseIdentifier: ReviewNewGoalCell.identifier)
    collectionView.showsVerticalScrollIndicator = false
    
    view.bringSubviewToFront(goalImageView)
  }
}

extension ReviewNewgoalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewNewGoalCell.identifier, for: indexPath) as! ReviewNewGoalCell
    cell.reviewNewGoalVIew.delegate = self
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: 600)
  }
  
}



//extension ReviewNewgoalViewController: ReviewNewGoalVIewDelegare {
//  func startgoal() {
//    let conrroller = MakeDepositViewController()
//    self.navigationController?.pushViewController(conrroller, animated: true)
//  }
//}



extension ReviewNewgoalViewController: ReviewNewGoalVIewDelegare {
  func startgoal() {
    let controller = MakeDepositViewController()
    navigationController?.pushViewController(controller, animated: true)
  }
}
