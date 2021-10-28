//
//  UploadPhotoViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 17/04/21.
//

import UIKit

class UploadPhotoViewController: UIViewController {

  var logoImageView: UIImageView?
  var uiloadInfoViewContainer: UIView = UIView()
  var selectedImage:UIImage?
  var spinner = UIActivityIndicatorView(style: .medium)
  
  override func loadView() {
    super.loadView()
    self.view.backgroundColor = .white
    setupUI()
  }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
  private func setupUI() {
      addLogo()
      addBackgroundView()
    self.perform(#selector(addbmitView), with: nil, afterDelay: 2.0)
  }
  
  func addLogo() {
    
    uiloadInfoViewContainer.frame = view.bounds
    view.addSubview(uiloadInfoViewContainer)
    
    logoImageView = UIImageView(image: UIImage(named: "bmclogo"))
    self.view.addSubview(logoImageView!)
    logoImageView?.contentMode = .scaleAspectFit
    logoImageView?.translatesAutoresizingMaskIntoConstraints = false
    
    logoImageView?.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    logoImageView?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    logoImageView?.widthAnchor.constraint(equalToConstant: 80).isActive = true
    logoImageView?.heightAnchor.constraint(equalToConstant: 60).isActive = true
  }
  
  func addBackgroundView() {
        
    self.view.backgroundColor = .white
    let v = UIView()
    v.backgroundColor = UIColor(hexString: "F3F3F3")
    uiloadInfoViewContainer.addSubview(v)
    
    v.translatesAutoresizingMaskIntoConstraints = false
    v.leadingAnchor.constraint(equalTo: uiloadInfoViewContainer.leadingAnchor, constant: 0).isActive = true
    v.trailingAnchor.constraint(equalTo: uiloadInfoViewContainer.trailingAnchor, constant: 0).isActive = true
    v.bottomAnchor.constraint(equalTo: uiloadInfoViewContainer.bottomAnchor, constant: 0).isActive = true
    v.topAnchor.constraint(equalTo: uiloadInfoViewContainer.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
    
    let path = UIBezierPath(roundedRect: view.frame, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 47, height: 47))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    v.layer.mask = mask
    
    showUploadMessage(v: v)
    
    

  }
  
  private func showUploadMessage(v: UIView) {
    if let photoMessage = Bundle.main.loadNibNamed("PhotoMessage", owner: self, options: nil)!.first as? PhotoMessage {
      photoMessage.initilize()
      v.addSubview(photoMessage)
      photoMessage.translatesAutoresizingMaskIntoConstraints = false
      
      photoMessage.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 40).isActive  = true
      photoMessage.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -40).isActive  = true
      photoMessage.topAnchor.constraint(equalTo: v.topAnchor, constant: 65).isActive  = true
      photoMessage.heightAnchor.constraint(equalToConstant: 210).isActive  = true
      
      photoMessage.layer.cornerRadius = 20
      
    }
    
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

       spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  @objc func addbmitView() {
        
    
    if let submitView = Bundle.main.loadNibNamed("SubmitPhoto", owner: self, options: nil)!.first as? SubmitPhoto {
      submitView.alpha = 0
      view.addSubview(submitView)      
      submitView.delegate = self
      submitView.initilize()
      submitView.photoImageView.image = selectedImage
      submitView.translatesAutoresizingMaskIntoConstraints = false
      
      submitView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
      submitView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
      submitView.topAnchor.constraint(equalTo: logoImageView!.bottomAnchor, constant: 20).isActive = true
      submitView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
      
      UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: []) {
        self.uiloadInfoViewContainer.alpha = 0
      } completion: { (completed) in
                
        self.showSubmitView(v: submitView)
      }
    }
    
    spinner.removeFromSuperview()
  }
  
  func showSubmitView(v:UIView) {
    UIView.animate(withDuration: 0.4) {
      v.alpha = 1
    }
  }  
}

extension UploadPhotoViewController: SubmitPhotoDelegate {
  func subbmitPhoto() {
    let controller = ContactInfoViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  func moveBack() {
    self.navigationController?.popViewController(animated: true)
  }
  
  
}
