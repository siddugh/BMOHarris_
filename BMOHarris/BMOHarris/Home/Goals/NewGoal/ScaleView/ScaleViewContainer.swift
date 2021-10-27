//
//  ScaleViewContainer.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 01/10/21.
//

import UIKit

class ScaleViewContainer: UIView {

  @IBOutlet weak var scaleScrollView: ScaleScrollView!
  @IBOutlet weak var scaleView: ScaleView!
  
  var scaleCollectionView: UICollectionView!
  
  let pointColor = UIColor(hexString: "D8D8D8")
  var currentOffeset:CGFloat = 0.0
  var delta:Double = 0
  var amount:Int = 92

  
  override func awakeFromNib() {
    super.awakeFromNib()
    initilize()
  }
  
  private func initilize() {
    scaleScrollView.delegate = self
    //scaleScrollView.isPagingEnabled = true
    scaleScrollView.isScrollEnabled = false
    self.perform(#selector(addIndicatorView), with: nil, afterDelay: 0.0)
  }
  
  
  @objc func addIndicatorView() {
    
    addSCaleView()
    scaleScrollView.contentSize = CGSize(width: self.bounds.width + 500, height: self.bounds.height)
    currentOffeset = scaleScrollView.contentOffset.x
    let letfpadding = 0 //self.bounds.width / 2 - 40
    let rightpadding = 0 //self.bounds.width - 40
    //scaleScrollView.contentInset = UIEdgeInsets(top: 0, left: CGFloat(letfpadding), bottom: 0, right: CGFloat(rightpadding))
    
    let indicatorLabel = UIView()
    indicatorLabel.frame = CGRect(x: self.bounds.width / 2 - 2, y: 0, width: 8, height: 42)
    indicatorLabel.layer.cornerRadius = 4
    indicatorLabel.backgroundColor = UIColor(hexString: "187ADC")
    self.addSubview(indicatorLabel)
    
    
   }
  
  
  func addSCaleView() {
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: 2, height: 30)
    layout.scrollDirection = .horizontal
    
    scaleCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
    self.addSubview(scaleCollectionView)
    scaleCollectionView.frame = self.bounds
    scaleCollectionView.delegate = self
    scaleCollectionView.dataSource = self
    scaleCollectionView.backgroundColor  = .white
    
    //scaleCollectionView.isPagingEnabled = true
    let letfpadding = self.bounds.width / 2
    let rightpadding = self.bounds.width / 2
    scaleCollectionView.contentInset =  UIEdgeInsets(top: 0, left: CGFloat(letfpadding), bottom: 0, right: CGFloat(rightpadding))
    scaleCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CELL")
  }
}

extension ScaleViewContainer: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
    cell.backgroundColor = .gray
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 2, height: 30)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}


extension ScaleViewContainer: UIScrollViewDelegate {
  
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    if currentOffeset > scrollView.contentOffset.x{
//      print("moving right....")
//    } else {
//      print("moving left....")
//    }
//  }
}
