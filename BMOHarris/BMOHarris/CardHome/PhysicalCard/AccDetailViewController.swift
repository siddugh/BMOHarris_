//
//  AccDetailViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 24/04/21.
//

import UIKit

class AccDetailViewController: UIViewController {

  
  var accDetailCollectionView:UICollectionView!
  
  override func loadView() {
    super.loadView()
    self.view.backgroundColor = .white
    setupUI()
  }
  
  func setupUI() {
    addAccDetailCollectionView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  func addAccDetailCollectionView() {
    
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: 1000, height: 1000)
    
    accDetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    self.view.addSubview(accDetailCollectionView)
    accDetailCollectionView.backgroundColor = .white
    accDetailCollectionView.translatesAutoresizingMaskIntoConstraints = false
    
    accDetailCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    accDetailCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    accDetailCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    accDetailCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    
    accDetailCollectionView.register(AccDetailCell.self, forCellWithReuseIdentifier: AccDetailCell.identifier)
    accDetailCollectionView.delegate = self
    accDetailCollectionView.dataSource = self
  }
    
}
extension AccDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccDetailCell.identifier, for: indexPath) as! AccDetailCell
    
    return cell

  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
  }
  
  
}
