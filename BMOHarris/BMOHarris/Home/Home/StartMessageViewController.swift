//
//  StartMessageViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 17/04/21.
//

import UIKit

class StartMessageViewController: UIViewController {

  var imageView: UIImageView!
  let cameraController = CameraViewController()
  override  func loadView() {
    super.loadView()
    //setupUI()
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor  = .white
      setupUI()
    }
  private func setupUI() {
    self.view.backgroundColor  = .white
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
    imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
    self.perform(#selector(roundRect), with: nil, afterDelay: 0.0)
  }
  
  @objc func roundRect() {
    let path = UIBezierPath(roundedRect: imageView.frame, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 30, height: 30))
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
      startMssgView.megLable.text = "You are applying to open\na Google Plex account which\nhas a Checking and Savings account\nbundled into one."
      startMssgView.layer.shadowOffset = CGSize.zero
      startMssgView.layer.shadowRadius = 3
      startMssgView.layer.shadowOpacity = 0.3
      
      startMssgView.layer.cornerRadius = 21

      startMssgView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive  = true
      startMssgView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive  = true
//      startMssgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
      //startMssgView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 80).isActive = true
      startMssgView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true

      startMssgView.heightAnchor.constraint(equalToConstant: 380).isActive = true
     }
   }
}

extension StartMessageViewController: StartMessageViewDelegate {
  func start() {
    let controller = TakePhotoInfoController()
    controller.delegate = self
    self.navigationController?.pushViewController(controller, animated: true)
  }
}

extension StartMessageViewController:TakePhotoInfoControllerDelegate {
  func onOpenCamera() {
    cameraController.delegate = self
    self.navigationController?.pushViewController(cameraController, animated: true)
  }
  
  func selectedImage(image: UIImage?) {
    
    Helper.dumpPhotoIdntity(image:image)
    //cameraController.movingToNextScreen = false
    
    let controller = UploadPhotoViewController()
    controller.selectedImage = image
    self.navigationController?.pushViewController(controller, animated: true)
  }
}

extension StartMessageViewController: CameraViewControllerDelegate {
  func selectedImage(photo:UIImage?) {
    
  }
}
