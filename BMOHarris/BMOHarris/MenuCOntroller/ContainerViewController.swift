//
//  ContainerViewController.swift
//  BMO
//
//  Created by Siddu Hallikeri on 05/05/21.
//

import UIKit

class ContainerViewController: UIViewController {

    var menuDelegate: MenuDelegate?
  var navController:UINavigationController!
  var menuViewController: MenuViewController?
  var tapGesture: UITapGestureRecognizer?
  var isleftPanelOpen:Bool = false
  var gestureView:UIView?
  var logoImage:UIImageView?
  var shadowView:UIView = UIView()
  
  var spinner = UIActivityIndicatorView(style: .medium)
    override func viewDidLoad() {
        super.viewDidLoad()
      

      
        addMainController()
      view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

  
  func addMainController() {
    
    if  UserDefaults.standard.bool(forKey: REGISTER)  == false{
      let homeController =    HomeViewController() ///HomeViewController()  //NewGoalViewController() //CachAndSavingAccountViewController()
      homeController.mDelegate = self
      navController = UINavigationController(rootViewController: homeController)
      navController.setNavigationBarHidden(true, animated: false)
      self.navController.view.backgroundColor = .white
      self.addChild(navController)
      self.view.addSubview(navController.view)
      navController.didMove(toParent: self)
    } else {
      let homeController =    CardHomeViewController() ///HomeViewController()  NewGoalViewController() //CachAndSavingAccountViewController()
      homeController.mDelegate = self
      navController = UINavigationController(rootViewController: homeController)
      navController.setNavigationBarHidden(true, animated: false)
      self.navController.view.backgroundColor = .white
      self.addChild(navController)
      self.view.addSubview(navController.view)
      navController.didMove(toParent: self)
    }
    
    navController.view.addSubview(shadowView)
    shadowView.backgroundColor = .white
    shadowView.translatesAutoresizingMaskIntoConstraints = false
    shadowView.leadingAnchor.constraint(equalTo: navController.view.leadingAnchor, constant: 0).isActive = true
    shadowView.topAnchor.constraint(equalTo: navController.view.topAnchor, constant: 0).isActive = true
    shadowView.bottomAnchor.constraint(equalTo: navController.view.bottomAnchor, constant: 0).isActive = true
    shadowView.widthAnchor.constraint(equalToConstant: 2).isActive = true
    
  }
  
  func addGesture() {
    
    if gestureView == nil {
      gestureView = UIView()
      navController.view.addSubview(gestureView!)
      gestureView?.frame = navController.view.bounds
      
      if tapGesture == nil {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        gestureView!.addGestureRecognizer(tapGesture!)
      }
    }
  }
  
  func removeTapGesture() {
    
    if gestureView != nil , tapGesture != nil{
      gestureView?.removeGestureRecognizer(tapGesture!)
      tapGesture = nil
      
      gestureView?.removeFromSuperview()
      gestureView = nil
      
    }
  }
  
  @objc func handleTapGesture() {
    showMenu()
  }
  
  @objc func loadRegisterdSCreen() {
    
    if let imv = logoImage {
      imv.removeFromSuperview()
      spinner.stopAnimating()
      spinner.alpha = 0
      logoImage = nil
      
      UserDefaults.standard.setValue(true, forKey: REGISTER)
      UserDefaults.standard.synchronize()
      
      self.navController.viewControllers.removeAll()
      let controller = CardHomeViewController()
      controller.mDelegate = self
      navController.viewControllers.append(controller)
    }
  }
}

extension ContainerViewController: MenuDelegate {
  func reload() {
    print("reload")
    
    if logoImage == nil {
     
      logoImage = UIImageView()
      logoImage?.image = UIImage(named: "bmclogo")
      logoImage?.contentMode = .scaleAspectFit
      view.addSubview(logoImage!)
      logoImage?.translatesAutoresizingMaskIntoConstraints = false
      logoImage?.widthAnchor.constraint(equalToConstant: 60).isActive = true
      logoImage?.heightAnchor.constraint(equalToConstant: 40).isActive = true
      logoImage?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
      logoImage?.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

    }
    
    spinner.translatesAutoresizingMaskIntoConstraints = false
    spinner.startAnimating()
    view.addSubview(spinner)
    spinner.color = .darkGray
    spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
    //spinner.widthAnchor.constraint(equalToConstant: 40).isActive = true
    //spinner.heightAnchor.constraint(equalToConstant: 40).isActive = true
    spinner.startAnimating()
    spinner.alpha = 1
    
    self.perform(#selector(loadRegisterdSCreen), with: nil, afterDelay: 2.0)

  }
  
  func showMenu() {
    print("showMenu.....")
    
    if isleftPanelOpen == false {
      if menuViewController == nil {
        menuViewController = MenuViewController()
        menuViewController?.delegate = self
        self.view.insertSubview(menuViewController!.view, at: 0)
      }
      addGesture()
      UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut) {
        self.navController.view.frame.origin.x = 250
        
        self.shadowView.layer.shadowOffset = CGSize(width: 10, height: 0)
        self.shadowView.layer.shadowRadius = 0.2
        self.shadowView.layer.shadowOpacity = 0.2
        self.shadowView.layer.shadowColor = UIColor.lightGray.cgColor
        
      } completion: { (_) in
        self.isleftPanelOpen = true
      }
    } else {
      
      removeTapGesture()
      UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut) {
        self.navController.view.frame.origin.x = 0
        
        self.shadowView.layer.shadowOffset = .zero
        self.shadowView.layer.shadowRadius = 0
        self.shadowView.layer.shadowOpacity = 0

      } completion: { (_) in
        self.isleftPanelOpen = false
        if let mCOntroller = self.menuViewController {
          mCOntroller.view.removeFromSuperview()
          self.menuViewController = nil
        }
      }
      
    }
  }
  
  func showViewController(vController:HomeViewController) {
    vController.mDelegate = self
    self.navController.viewControllers.removeAll()
    navController.viewControllers.append(vController)

    UserDefaults.standard.setValue(false, forKey: REGISTER)
    UserDefaults.standard.synchronize()

    showMenu()
  }
  
}
