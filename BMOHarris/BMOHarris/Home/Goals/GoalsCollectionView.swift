//
//  GoalsCollectionView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import UIKit

protocol GoalsCollectionViewDelegate: AnyObject {
  func showDetailsOf(goal: GoalModel)
}

class GoalsCollectionView: UICollectionView {
  
  var goals: [GoalModel] = [GoalModel]()
  weak var goalsDelegate: GoalsCollectionViewDelegate?
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  //Mark: - Private functions
  
  private func setupView() {
    self.showsHorizontalScrollIndicator = false
    self.showsVerticalScrollIndicator = false
    self.delegate = self
    self.dataSource = self
    self.register(GoalCell.nib, forCellWithReuseIdentifier: GoalCell.reuseIdentifier)
    
    self.backgroundColor = .white
  }
  
  func loadGoals(goals: [GoalModel]) {
    self.goals = goals
    reloadData()
  }
  //Mark: - Public functions
  
}

extension GoalsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return goals.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalCell.reuseIdentifier, for: indexPath) as! GoalCell
    cell.configure(goals[indexPath.item], indexPath: indexPath)
    return  cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.item == 1 {
      print("SHow emergency view....")
      goalsDelegate?.showDetailsOf(goal: goals[indexPath.item])
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
}
