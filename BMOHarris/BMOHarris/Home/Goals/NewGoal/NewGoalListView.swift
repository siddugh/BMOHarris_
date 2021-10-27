//
//  NewGoalListView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 05/10/21.
//

import UIKit

class NewGoalListView: UIView {

  
  var collectionView: UICollectionView!
  var goalViewModel: GoalsViewModel?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initilize()
  }
  
  convenience init(frame: CGRect, viewModel: GoalsViewModel) {
    self.init(frame: frame)
    self.goalViewModel = viewModel
  }
    
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func initilize() {
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 20
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: 1000, height: 1000)
    layout.scrollDirection = .horizontal
    
    
    collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
    self.addSubview(collectionView)
    collectionView.frame = self.bounds
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = false
    
    collectionView.clipsToBounds = true
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(NewGoalCell.nib, forCellWithReuseIdentifier: NewGoalCell.reuseIdentifier)
    collectionView.backgroundColor = .clear
    collectionView.reloadData()
    
  }

}

extension NewGoalListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    let leftPadding = (collectionView.frame.size.width - collectionView.frame.size.height) / 2.0
    //let leftPadding:CGFloat = 100
    let rightPadding = leftPadding
    
    collectionView.contentInset = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: rightPadding)

    return goalViewModel?.newGoals?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewGoalCell.reuseIdentifier, for: indexPath) as! NewGoalCell
    if let goalmodel = goalViewModel?.newGoals?[indexPath.item] {
      cell.configure(goalmodel, indexPath: indexPath)
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    print("Selected Index: \(indexPath.item)")
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
  
}

extension NewGoalListView: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    if scrollView == collectionView {
      // center X of collection view
      let centerX = self.collectionView.center.x
      
      // only perform the scaling on cells that are visible on scree
      for cell in collectionView.visibleCells {
        // coodinates of the cell in super view space
        let cellframe = cell.convert(cell.frame, to: nil)
        print("cellframe: \(cellframe)")
        let basePosition = cell.convert(CGRect.zero, to: self)
        print("basePosition : \(basePosition)")
        print("collectionView.frame.size.height : \(collectionView.frame.size.height)")
        print("collectionView.frame.size.width : \(collectionView.frame.size.width)")
        print("basePosition.midX : \(basePosition.midX)")
        let cellCenterX = basePosition.midX + collectionView.frame.size.height / 2.0
        print("cellCenterX : \(cellCenterX)")
        
        let distance = abs(cellCenterX - centerX)
        let tolarence: CGFloat = 0.02
        var scale = 1.20 + tolarence - (distance / centerX)
        print("scale: \(scale)")
        if scale > 1.2 {
          scale = 1.2
        }
        
        if scale < 0.7 {
          scale = 0.7
        }
        
        cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        
      }
    }
  }
}
