//
//  UploadProofIdentityViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 19/04/21.
//

import UIKit

class UploadProofIdentityViewController: UIViewController {

  var upLoadableView: UITableView = UITableView()
  var headeView:BMOHeaderView!
  var titleHeaderView:TitleHeaderView!

  weak var upLoadCell:UploadDocCell?
  var identityType:Identity = .kPhoto
  
  var showingPhoto: Bool = false
  var showingAddress: Bool = false
  
  override func loadView() {
    super.loadView()
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    setupUI()
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  func setupUI() {
    self.view.backgroundColor = .white
    headeView = BMOHeaderView(frame: CGRect.zero)
    self.view.addSubview(headeView)
    headeView.translatesAutoresizingMaskIntoConstraints = false
    
    headeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    headeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    headeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    headeView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
      titleHeaderView = Bundle.main.loadNibNamed("TitleHeaderView", owner: self, options: nil)!.first as? TitleHeaderView
      
      view.addSubview(titleHeaderView)
      titleHeaderView.translatesAutoresizingMaskIntoConstraints = false
      titleHeaderView.initilize()
      
      titleHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive  = true
      titleHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive  = true
      titleHeaderView.topAnchor.constraint(equalTo: headeView.bottomAnchor, constant: 30).isActive  = true
      titleHeaderView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    titleHeaderView.settitle(title: "Upload Docs")
    titleHeaderView.setInfoImage(image: UIImage(named: "fileupload")!)
    
    
    addTableView()
  }
  
  func addTableView() {
    view.addSubview(upLoadableView)
    upLoadableView.translatesAutoresizingMaskIntoConstraints = false
    upLoadableView.backgroundColor = .white
    
    upLoadableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    upLoadableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    upLoadableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    upLoadableView.topAnchor.constraint(equalTo: titleHeaderView.bottomAnchor, constant: 10).isActive = true
    
    upLoadableView.backgroundColor = .white
    upLoadableView.delegate = self
    upLoadableView.dataSource = self
    upLoadableView.register(UploadDocCell.nib, forCellReuseIdentifier: UploadDocCell.identifier)
    upLoadableView.separatorStyle = .none
  }
  
  func showAddressIdentityView() {
    showingAddress = true
    upLoadableView.reloadData()

    upLoadCell?.identityProofView?.addressIdentityViewHTCOnstraint.constant = 200
    upLoadCell?.identityProofView?.addressProofImageView.image = Helper.getSavedImage(named: addressIdentity)
    animate()
  }
  func showPhotoIdentityView() {
    showingPhoto = true
    upLoadableView.reloadData()
    
    upLoadCell?.identityProofView?.phIdentityVIewHTConstraint.constant = 200
    upLoadCell?.identityProofView?.photoProofImageView.image = Helper.getSavedImage(named: photoIdentity)
    animate()
  }
  
  func animate() {
    UIView.animate(withDuration: 0.4) {
      self.view.layoutIfNeeded()
    } completion: { (completed) in
      self.upLoadCell?.identityProofView?.setPhotoUpLoadTitle(title:"Re-upload")
    }
  }
  
  func openCamera() {
    let cameraController = CameraViewController()
    cameraController.delegate = self
    self.navigationController?.pushViewController(cameraController, animated: true)
  }
}

extension UploadProofIdentityViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: UploadDocCell.identifier, for: indexPath) as! UploadDocCell
    cell.identityProofView?.delegate = self
    upLoadCell = cell
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return getheightFForCell()
  }
  
  func getheightFForCell() -> CGFloat {
    
    if showingPhoto, showingAddress {
      return 950
    }
    if showingPhoto, showingAddress == false {
      return 750
    }
    
    if showingPhoto == false, showingAddress {
      return 750
    }

    
    return 400
  }
}

extension UploadProofIdentityViewController: IdentityProofViewDelegate {
  func uploadPhotoIdentity() {
    identityType = .kPhoto
    openCamera()
  }
  
  func uploadAddressIdentity() {
    //showAddressIdentityView()
    identityType = .kAddress
    openCamera()
  }
  
  func useDriverLicense() {
    UIView.animate(withDuration: 0.4) {
      self.upLoadCell?.identityProofView?.uolpadDriverIdentitybt.alpha = 0
    } completion: { (_) in
    }
    showPhotoIdentityView()
  }
  
  func submit() {
    let controller = DocVerificationMsgViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  func moveBack() {
    
  }
}

extension UploadProofIdentityViewController: ReUploadIdentityViewControllerDelegate {
  func updatedAddresIdentity(image: UIImage?) {
    showAddressIdentityView()
  }
  
  func updatedPhotoIdentity(image: UIImage?) {
    showAddressIdentityView()
  }
}

extension UploadProofIdentityViewController: CameraViewControllerDelegate {
  func selectedImage(image: UIImage?) {
    self.navigationController?.popToViewController(self, animated: true)
    if identityType == .kPhoto {
      Helper.dumpImageToFile(image: image, file: photoIdentity)
      showPhotoIdentityView()
    }
    
    if identityType == .kAddress {
      Helper.dumpImageToFile(image: image, file: addressIdentity)
      showAddressIdentityView()
    }
  }
}
