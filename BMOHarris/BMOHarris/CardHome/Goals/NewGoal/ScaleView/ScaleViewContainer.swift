//
//  ScaleViewContainer.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 01/10/21.
//

import UIKit

protocol ScaleViewContainerDelegate: AnyObject {
  func scaleValue(value:Int)
}

class ScaleViewContainer: UIView {

  @IBOutlet weak var scaleScrollView: ScaleScrollView!
  @IBOutlet weak var scaleView: ScaleView!
  
  var scaleCollectionView: UICollectionView!
  
  let pointColor = UIColor(hexString: "D8D8D8")
  var currentOffeset:CGFloat = 0.0
  var delta:Double = 0
  var amount:Int = 92
  var currentIndexPath: IndexPath?
  var scaleValues: [ScaleModel] = [ScaleModel]()
  var delegate: ScaleViewContainerDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    getScaleValues()
    initilize()
  }
  
  private func initilize() {
    self.perform(#selector(addIndicatorView), with: nil, afterDelay: 0.0)
    self.perform(#selector(update), with: nil, afterDelay: 0.4)
    
  }
  
  func getScaleValues() {
    var initialVal:Int = 50
    for _ in 0..<50 {
      scaleValues.append(ScaleModel(value: initialVal))
      initialVal += 10
    }
  }
  
  @objc func addIndicatorView() {
    
    addSCaleView()
    let indicatorLabel = UIView()
    indicatorLabel.frame = CGRect(x: self.bounds.width / 2 - 2, y: 0, width: 8, height: 35)
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
    let viewFrame = self.bounds
    scaleCollectionView.frame = CGRect(x: viewFrame.origin.x, y: viewFrame.origin.y + 4, width: viewFrame.size.width, height: viewFrame.size.height)
    scaleCollectionView.showsHorizontalScrollIndicator = false
    scaleCollectionView.delegate = self
    scaleCollectionView.dataSource = self
    scaleCollectionView.backgroundColor  = .white
    
    //scaleCollectionView.isPagingEnabled = true
    let letfpadding = self.bounds.width / 2
    let rightpadding = self.bounds.width / 2
    scaleCollectionView.contentInset =  UIEdgeInsets(top: 0, left: CGFloat(letfpadding), bottom: 0, right: CGFloat(rightpadding))
    scaleCollectionView.register(ScaleCell.nib, forCellWithReuseIdentifier: ScaleCell.reuseIdentifier)
  }
  
  @objc func update() {
    scaleCollectionView.scrollToItem(at: IndexPath(item: 3, section: 0), at: .right, animated: true)
  }
  
}

extension ScaleViewContainer: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return scaleValues.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScaleCell.reuseIdentifier, for: indexPath) as! ScaleCell
    cell.configure(scaleValues[indexPath.item], indexPath: indexPath)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 2, height: collectionView.bounds.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}


extension ScaleViewContainer: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    var tableCenter = self.scaleCollectionView.center
    tableCenter = self.scaleCollectionView.convert(tableCenter, from: self.scaleCollectionView.superview!)
    if let centerIndex = scaleCollectionView.indexPathForItem(at: tableCenter) {
      print("Selected scale Val : \(scaleValues[centerIndex.item])")
      delegate?.scaleValue(value: scaleValues[centerIndex.item].value)
      self.currentIndexPath = centerIndex
      let impacktFeedBack = UIImpactFeedbackGenerator(style: .light)
      impacktFeedBack.prepare()
      impacktFeedBack.impactOccurred(intensity: 5)
      
    }
  }
}
