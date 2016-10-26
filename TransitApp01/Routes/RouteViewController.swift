//
//  RouteViewController.swift
//  TransitApp01
//
//  Created by Matthias Zarzecki on 25/10/16.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController {

  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var disclaimer: UILabel!
  @IBOutlet weak var providerIcon: UIWebView!
  
  var detailItem: Route? {
    didSet {
      //self.configureView()
    }
  }
  
  // MARK: - Setup Functions

  func configureView() {
    if let detail = self.detailItem {
      name.text = Route.getDisplayName(route: detail)
      price.text = Route.getPriceString(route: detail)
      disclaimer.text = detail.disclaimer ?? ""
      
      if let urlString = detailItem?.provider_icon_url {
        if let url = URL(string: urlString) {
          providerIcon.loadRequest(NSURLRequest(url: url) as URLRequest)
        }
      }
    }
  }
  
  // MARK: - View Functions

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
