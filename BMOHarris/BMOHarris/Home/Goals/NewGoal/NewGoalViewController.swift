//
//  NewGoalCollectionView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 04/10/21.
//

import UIKit

class NewGoalViewController: UIViewController {

  var collectionView: UICollectionView!

  override func loadView() {
    super.loadView()
    //initilize()
    //self.perform(#selector(initilize), with: nil, afterDelay: 0.1)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    //initilize()
    //self.perform(#selector(initilize), with: nil, afterDelay: 0.1)
    setupUI()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    //.initilize()
    //view.layoutIfNeeded()
  }
  
  private func setupUI() {
    let newgoalView = UINib(nibName: "NewGoalView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! NewGoalView
    view.addSubview(newgoalView)
    newgoalView.frame = view.bounds
    newgoalView.delegate = self
    
    let newLabel = UILabel()
    view.addSubview(newLabel)
    newLabel.text = "New Goal"
    newLabel.font = UIFont(name: "Rubik-Medium", size: 18)
    newLabel.translatesAutoresizingMaskIntoConstraints  = false
    newLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    newLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
    newLabel.textColor = .white
    
    let removeButton = UIButton()
    view.addSubview(removeButton)
    removeButton.setImage(UIImage(named: "remove"), for: .normal)
    removeButton.frame = CGRect(x: 10, y: 40, width: 35, height: 35)
    removeButton.addTarget(self, action: #selector(removeAction), for: .touchUpInside)
  }
  
  @objc func removeAction() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func initilize() {
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 20
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: 1000, height: 1000)
    layout.scrollDirection = .horizontal
    
    
    collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
    self.view.addSubview(collectionView)
    collectionView.frame = view.bounds
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = false
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
    collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    
    collectionView.clipsToBounds = true
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(NewGoalCell.nib, forCellWithReuseIdentifier: NewGoalCell.reuseIdentifier)
    collectionView.backgroundColor = .white
    collectionView.reloadData()
    //collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .right, animated: true)

  }
  
  
}

extension NewGoalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    let leftPadding = (collectionView.frame.size.width - collectionView.frame.size.height) / 2.0
    //let leftPadding:CGFloat = 100
    let rightPadding = leftPadding
    collectionView.contentInset = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: rightPadding)

    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewGoalCell.reuseIdentifier, for: indexPath) as! NewGoalCell
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    print("Selected Index: \(indexPath.item)")
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //CGSize(width: self.view.bounds.width, height: 60)
    CGSize(width: 100, height: 100)
    //return collectionView.bounds.size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}


extension NewGoalViewController: NewGoalViewDelegate {
  func reviewNewGoal() {
    let conroller = ReviewNewgoalViewController()
    navigationController?.pushViewController(conroller, animated: true)
  }
  
  
}
