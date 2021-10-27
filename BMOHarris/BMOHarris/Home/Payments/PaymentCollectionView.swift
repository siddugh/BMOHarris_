//
//  PaymentCollectionView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 27/09/21.
//

import UIKit

class PaymentCollectionView: UICollectionView {
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  //Mark: - Private functions
  
  private func setupView() {
    self.backgroundColor = .white
    self.delegate = self
    self.dataSource = self
    self.register(PaymentCell.nib, forCellWithReuseIdentifier: PaymentCell.reuseIdentifier)
  }
  
  //Mark: - Public functions
  
}

extension PaymentCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 25
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaymentCell.reuseIdentifier, for: indexPath) as! PaymentCell
    
    return  cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: collectionView.bounds.width, height: 60)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
  
}
