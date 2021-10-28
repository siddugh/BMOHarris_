//
//  DocVerificationMsgViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 02/05/21.
//

import UIKit

class DocVerificationMsgViewController: UIViewController {

  var msgContainerView: UIView!
  var uploadstatusView: UploadStatusMessage?
  var successStatusMsgView: SuccessMessageVIew?
  
  var controller: UIViewController?
  var spinner = UIActivityIndicatorView(style: .medium)

  override func loadView() {
    super.loadView()
    setupUI()
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
    showMwessageTYpe2()
    
  }
  
  @objc func showMwessageTYpe(){
    
    uploadstatusView = Bundle.main.loadNibNamed("UploadStatusMessage", owner: self, options: nil)!.first as? UploadStatusMessage
    uploadstatusView?.initilize()
    uploadstatusView?.describtionLabel1.text = "We have submitted the"
    uploadstatusView?.describtionLabe2.text = "Documents for verification"
    
      view.addSubview(uploadstatusView!)
    uploadstatusView?.translatesAutoresizingMaskIntoConstraints = false
      
    uploadstatusView?.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    uploadstatusView?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    uploadstatusView?.widthAnchor.constraint(equalToConstant: 250).isActive = true
    uploadstatusView?.heightAnchor.constraint(equalToConstant: 200).isActive = true
    uploadstatusView?.layer.cornerRadius = 18
      
    uploadstatusView?.layer.shadowOffset = CGSize.zero
    uploadstatusView?.layer.shadowRadius = 1.0
    uploadstatusView?.layer.shadowOpacity = 0.3
      
      
      spinner.translatesAutoresizingMaskIntoConstraints = false
      spinner.startAnimating()
      view.addSubview(spinner)

     spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
     spinner.bottomAnchor.constraint(equalTo: uploadstatusView!.bottomAnchor,constant:-15).isActive = true
        
    self.perform(#selector(movetoOtherScreen), with: nil, afterDelay: 3.0)
  }
  
  @objc func movetoOtherScreen() {
    successStatusMsgView?.alpha = 0
    successStatusMsgView?.isHidden = false

    UIView.animate(withDuration: 0.4) {
      self.uploadstatusView?.alpha = 0
      self.successStatusMsgView?.alpha = 1
    } completion: { (_) in
      self.perform(#selector(self.movetoOtherScreen2), with: nil, afterDelay: 2.0)
    }
  }
  
  @objc func showMwessageTYpe2() {
    
    successStatusMsgView = Bundle.main.loadNibNamed("SuccessMessageVIew", owner: self, options: nil)!.first as? SuccessMessageVIew
    successStatusMsgView?.initilize()
    successStatusMsgView?.titleLabel1.text = "Done!"
    successStatusMsgView?.titleLabel2.text = "Almost there!"
      msgContainerView.addSubview(successStatusMsgView!)
    successStatusMsgView?.translatesAutoresizingMaskIntoConstraints = false
      
    successStatusMsgView?.centerXAnchor.constraint(equalTo: msgContainerView.centerXAnchor, constant: 0).isActive = true
    successStatusMsgView?.topAnchor.constraint(equalTo: msgContainerView.topAnchor, constant: 30).isActive = true
    successStatusMsgView?.widthAnchor.constraint(equalToConstant: 250).isActive = true
    successStatusMsgView?.heightAnchor.constraint(equalToConstant: 150).isActive = true
    successStatusMsgView?.layer.cornerRadius = 18
      
      
    successStatusMsgView?.layer.shadowOffset = .zero
    successStatusMsgView?.layer.shadowRadius = 1.5
    successStatusMsgView?.layer.shadowOpacity = 0.3

   spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
   spinner.bottomAnchor.constraint(equalTo: successStatusMsgView!.bottomAnchor,constant: -20).isActive = true
    view.addSubview(spinner)
    
    //successStatusMsgView?.alpha = 0
    successStatusMsgView?.isHidden = true
        
  }
  
  @objc func movetoOtherScreen2() {
    //spinner.removeFromSuperview()
    let controller = GotoMyAccountMSGViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
