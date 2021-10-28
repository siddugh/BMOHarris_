//
//  ServiceView.swift
//  BMOHarris
//
//  Created by Siddu Hallikeri on 24/09/21.
//

import UIKit


protocol ServiceViewDelegate: AnyObject {
 func  loadService(type: ServiceType)
}

class ServiceView: UIView {

  var serviceCollectionView: UICollectionView!
  var collectionViewFrame: CGRect = .zero
  var service: ServiceViewModel?
  
  weak var delegate: ServiceViewDelegate?
  
  convenience init(frame: CGRect, service: ServiceViewModel) {
    self.init(frame: frame)
    self.service = service
    self.collectionViewFrame = frame
    initilize()
    
  }
  
  override init(frame: CGRect) {
    //self.collectionViewFrame = frame
    super.init(frame: frame)
//    initilize()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    //initilize()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    //initilize()
  }
  
  private func initilize() {
    addServiceView()
    self.backgroundColor = .brown
  }
  
  private func addServiceView() {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: 150, height: collectionViewFrame.height)
    layout.scrollDirection = .horizontal
    
    serviceCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
    self.addSubview(serviceCollectionView)
    serviceCollectionView.frame = self.bounds
    
    serviceCollectionView.delegate = self
    serviceCollectionView.dataSource = self
    serviceCollectionView.register(ServiceCell.nib, forCellWithReuseIdentifier: ServiceCell.reuseIdentifier)
    serviceCollectionView.backgroundColor = .white
    serviceCollectionView.showsHorizontalScrollIndicator = false
  }
}

extension ServiceView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return service?.service.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCell.reuseIdentifier, for: indexPath) as! ServiceCell
    if let serviceViewmodel = service {
      cell.configure(serviceViewmodel, indexPath: indexPath)
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //let servicetype =
    if let item = service?.service[indexPath.item] {
      delegate?.loadService(type: item.type)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: 140, height: collectionViewFrame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 15
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
    return 10
  }
}
