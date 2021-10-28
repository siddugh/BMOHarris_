//
//  GotoMyAccountMSGViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 02/05/21.
//

import UIKit

class GotoMyAccountMSGViewController: UIViewController {

  var imageView: UIImageView!
  override  func loadView() {
    super.loadView()
    setupUI()
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor  = UIColor(hexString: "187ADC")
      //setupUI()
    }
  private func setupUI() {
    self.view.backgroundColor  = UIColor(hexString: "187ADC")
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    addImageView()
    addMessageView()
  }
  @objc private func addImageView() {
    imageView = UIImageView(frame: CGRect.zero)
    self.view.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "starthome")
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .green
    imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
    imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    imageView.topAnchor.constraint(equalTo: self.view.topAnchor , constant: 0).isActive = true
    imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.48).isActive = true
        
    self.perform(#selector(roundRect), with: nil, afterDelay: 0.0)
  }
  
  @objc func roundRect() {
    let path = UIBezierPath(roundedRect: imageView.frame, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 40, height: 40))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    imageView.layer.mask = mask

  }

  @objc private func addMessageView() {
     
     if let startMssgView = Bundle.main.loadNibNamed("StartMessageView", owner: self, options: nil)!.first as? StartMessageView {
      startMssgView.translatesAutoresizingMaskIntoConstraints  = false
       self.view.addSubview(startMssgView)
      startMssgView.initilize()
      startMssgView.delegate = self
      startMssgView.megLable.text = "Your Google Plex\nChecking and Savings account\nhas been activated"
      startMssgView.startButton.setTitle("Go to my Account", for: .normal)
      startMssgView.layer.shadowOffset = CGSize.zero
      startMssgView.layer.shadowRadius = 3
      startMssgView.layer.shadowOpacity = 0.3
      
      startMssgView.layer.cornerRadius = 21

      startMssgView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive  = true
      startMssgView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive  = true
//      startMssgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
      //startMssgView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 80).isActive = true
      startMssgView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true

      startMssgView.heightAnchor.constraint(equalToConstant: 350).isActive = true
      
      
      let overdraftMsgIMV = UIImageView()
      overdraftMsgIMV.image = UIImage(named: "overdraftmsg1")
      view.addSubview(overdraftMsgIMV)
      overdraftMsgIMV.translatesAutoresizingMaskIntoConstraints = false
      overdraftMsgIMV.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
      overdraftMsgIMV.topAnchor.constraint(equalTo: startMssgView.bottomAnchor, constant: 30).isActive = true
      overdraftMsgIMV.widthAnchor.constraint(equalToConstant: 155).isActive = true
      overdraftMsgIMV.heightAnchor.constraint(equalToConstant: 70).isActive = true
      overdraftMsgIMV.contentMode = .scaleAspectFit

      
      
     }
   }
}

extension GotoMyAccountMSGViewController: StartMessageViewDelegate{
  func start() {
    if let vControllers = self.navigationController?.viewControllers {
      if vControllers.count > 0 {
        UIView.animate(withDuration: 0.5) {
          self.view.alpha = 0
        } completion: { (_) in
          if let homeController = vControllers[0] as? HomeViewController {
            homeController.mDelegate?.reload()
          }
        }
      }
    }
//    let controller = CachAndSavingAccountViewController()
//    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
}
