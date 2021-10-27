//
//  ScheduledSavCollectionView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 26/10/21.
//

import UIKit

class ScheduledSavCollectionView: UICollectionView {
  
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
    self.delegate = self
    self.dataSource = self
    self.register(ScheduledSavingCell.nib, forCellWithReuseIdentifier: ScheduledSavingCell.reuseIdentifier)
    
    self.backgroundColor = .white
  }
  
  //Mark: - Public functions
  
}

extension ScheduledSavCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 25
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduledSavingCell.reuseIdentifier, for: indexPath) as! ScheduledSavingCell
    
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
