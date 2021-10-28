//
//  HomeViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 16/04/21.
//

import UIKit

class HomeViewController: UIViewController {

  weak var mDelegate: MenuDelegate?
  
  override  func loadView() {
    super.loadView()
    setupUI()
  }
  
  func setupUI() {
    self.view.backgroundColor = .white
    self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    addImageView()
    addBankOptionsView()
    //self.perform(#selector(addBankOptionsView), with: nil, afterDelay: 0.2)
  }
  
  @objc private func addImageView() {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2))
    self.view.addSubview(imageView)
    imageView.image = UIImage(named: "homebg")
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .yellow
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
    imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    imageView.topAnchor.constraint(equalTo: self.view.topAnchor , constant: 0).isActive = true
    imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
  }
  
 @objc private func addBankOptionsView() {
    
    if let bankOptionView = Bundle.main.loadNibNamed("HomeView", owner: self, options: nil)!.first as? HomeView {
      bankOptionView.translatesAutoresizingMaskIntoConstraints  = false
      self.view.addSubview(bankOptionView)
      bankOptionView.delegate = self
      //bankOptionView.setTopCornerRadius(radius: CGSize(width: 44, height: 44))
      //bankOptionView.setTopCornerRadius(radius: CGSize(width: 64, height: 64))
      
      let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 54, height: 54))
      let mask = CAShapeLayer()
      mask.path = path.cgPath
      bankOptionView.layer.mask = mask

      
      print("Bounds:  \(self.view.bounds)")

      bankOptionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive  = true
      bankOptionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive  = true
      bankOptionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive  = true
      //bankOptionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7).isActive = true
      bankOptionView.heightAnchor.constraint(equalToConstant: 520).isActive = true
      
      let googlePlexImage = UIImageView()
      googlePlexImage.image = UIImage(named: "googleplex")
      view.addSubview(googlePlexImage)
      googlePlexImage.translatesAutoresizingMaskIntoConstraints = false
      googlePlexImage.contentMode = .scaleAspectFit
      googlePlexImage.centerXAnchor.constraint(equalTo: bankOptionView.centerXAnchor, constant: 0).isActive = true
      googlePlexImage.centerYAnchor.constraint(equalTo: bankOptionView.topAnchor, constant: -15).isActive = true
      googlePlexImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
      googlePlexImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    //addImageView()
    //addBankOptionsView()
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension HomeViewController:HomeViewDelegate {
  func start() {
    let controller = StartMessageViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
}


extension HomeViewController: UIGestureRecognizerDelegate {
  func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
      //return true

    return navigationController!.viewControllers.count > 1
  }
}
