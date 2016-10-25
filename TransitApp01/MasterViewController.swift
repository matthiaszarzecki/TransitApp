//
//  MasterViewController.swift
//  SwiftTutorial01
//
//  Created by Matthias Zarzecki on 25/10/16.
//  Copyright © 2016 Matthias Zarzecki. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

  var detailViewController: DetailViewController? = nil
  var objects = [Route]()
  //var transitData: NSDictionary? = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let tansitData = getTransitData() {
      setupRoutes(transitData: tansitData)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Private Methods
  
  func getTransitData() -> NSDictionary? {
    return Utilities.getJSonFileAsDictionary(Constants.Data)
  }
  
  func setupRoutes(transitData: NSDictionary) {
    if let routes: [AnyObject] = transitData[Constants.Routes] as? [AnyObject] {
      for route in routes {
        objects.append(createRouteObject(data: route))
      }
    }
  }
  
  func createRouteObject(data: AnyObject) -> Route {
    let newRoute = Route()
    
    newRoute.type = (data[Constants.RouteType] as? String) ?? ""
    newRoute.provider = (data[Constants.Provider] as? String) ?? ""
    newRoute.properties = (data[Constants.Properties] as? String) ?? ""
    newRoute.price = (data[Constants.Price] as? Dictionary<String, AnyObject>) ?? nil
    newRoute.segments = (data[Constants.Segments] as? Array<AnyObject>) ?? nil
    
    return newRoute
  }

  // MARK: - Segues

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        let navigationController = segue.destination as! UINavigationController
        let controller = navigationController.topViewController as! DetailViewController
        controller.detailItem = objects[(indexPath as NSIndexPath).row]
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }

  // MARK: - Table View

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    let object = objects[(indexPath as NSIndexPath).row]
    cell.textLabel!.text = "\(object.type) \(object.provider)"
    return cell
  }

  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  
}
