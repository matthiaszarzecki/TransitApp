//
//  DetailViewController.swift
//  SwiftTutorial01
//
//  Created by Matthias Zarzecki on 25/10/16.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var price: UILabel!
  
  var detailItem: Route? {
    didSet {
      self.configureView()
    }
  }
  
  // MARK: - Setup Functions

  func configureView() {
    if let detail = self.detailItem {
      if let nameDisplay = self.name {
        nameDisplay.text = detail.display_name != nil ? detail.display_name : "\(detail.type) \(detail.provider)"
      }
      
      if let priceDisplay = self.price {
        priceDisplay.text = getPriceString(route: detail)
      }
    }
  }
  
  func getPriceString(route: Route) -> String {
    var priceString = ""
    
    if let priceDetail = route.price {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.currencyCode = (priceDetail[Keys.Currency] as? String) ?? Defaults.Currency
      if let amount = priceDetail[Keys.Amount] as? Double {
        priceString = formatter.string(from: NSNumber(value: amount * 0.01))!
      }
    }
    
    return priceString != "" ? priceString : Texts.NoPrice
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
