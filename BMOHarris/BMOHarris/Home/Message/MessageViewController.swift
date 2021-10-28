//
//  MessageViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 29/04/21.
//

import UIKit

class MessageViewController: UIViewController {

  var msgContainerView: UIView!
  var controller: UIViewController?
  var spinner = UIActivityIndicatorView(style: .medium)
  
  override func loadView() {
    super.loadView()
    setupUI()
  }
  
  deinit {
    controller = nil
  }
  
  func setupUI() {
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    view.backgroundColor = .white
    
    let imageView = UIImageView()
    view.addSubview(imageView)
    imageView.image = UIImage(named: "bmclogo")
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: view.bounds.width / 2 - 45, y: 40, width: 90, height: 70)
    
    msgContainerView = UIView()
    view.addSubview(msgContainerView)
    msgContainerView.backgroundColor = .lightGray
    msgContainerView.translatesAutoresizingMaskIntoConstraints = false
    msgContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    msgContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    msgContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    msgContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    msgContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
    
    let path = UIBezierPath(roundedRect: view.frame, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 47, height: 47))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    msgContainerView.layer.mask = mask
    msgContainerView.backgroundColor = UIColor(hexString: "F3F3F3", alpha: 1)
       
    showMwessageTYpe()
  }
  
  @objc func showMwessageTYpe(){
    
    if let statusMsg = Bundle.main.loadNibNamed("UploadStatusMessage", owner: self, options: nil)!.first as? UploadStatusMessage {
      statusMsg.initilize()
      view.addSubview(statusMsg)
      statusMsg.translatesAutoresizingMaskIntoConstraints = false
      
      statusMsg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
      statusMsg.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
      statusMsg.widthAnchor.constraint(equalToConstant: 250).isActive = true
      statusMsg.heightAnchor.constraint(equalToConstant: 200).isActive = true
      statusMsg.layer.cornerRadius = 15
      
      statusMsg.layer.shadowOffset = CGSize.zero
      statusMsg.layer.shadowRadius = 1.0
      statusMsg.layer.shadowOpacity = 0.3
      
      
      spinner.translatesAutoresizingMaskIntoConstraints = false
      spinner.startAnimating()
      view.addSubview(spinner)

     spinner.centerXAnchor.constraint(equalTo: statusMsg.centerXAnchor).isActive = true
     spinner.bottomAnchor.constraint(equalTo: statusMsg.bottomAnchor, constant: -10).isActive = true

    }
    
    self.perform(#selector(movetoOtherScreen), with: nil, afterDelay: 2.0)
    
  }
 
  
  @objc func movetoOtherScreen() {
    spinner.removeFromSuperview()
    let controller = SuccessMsgViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
}
