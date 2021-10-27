//
//  ScheduledSavCollectionView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 26/10/21.
//

import UIKit

class ScheduledSavCollectionView: UICollectionView {
  
  
  var savings:[SavingModel] = [SavingModel]()
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    addScheduledSavings()
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  //Mark: - Private functions
  
  private func setupView() {
    self.showsHorizontalScrollIndicator = false
    self.delegate = self
    self.dataSource = self
    self.register(ScheduledSavingCell.nib, forCellWithReuseIdentifier: ScheduledSavingCell.reuseIdentifier)
    
    self.backgroundColor = .white
  }
  
  func addScheduledSavings() {
    
    savings.append(SavingModel(saving: "Round up", timeStamp: "14:34", image: "roundup", price: "+$8.05"))
    savings.append(SavingModel(saving: "Recurring transfer", timeStamp: "13:27", image: "recurring", price: "+$25.00"))
  }
  
}

extension ScheduledSavCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return savings.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduledSavingCell.reuseIdentifier, for: indexPath) as! ScheduledSavingCell
    cell.configure(savings[indexPath.item], indexPath: indexPath)
    return  cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: collectionView.bounds.width - 40, height: 60)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
}
