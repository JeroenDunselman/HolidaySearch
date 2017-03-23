//
//  MyViewController.swift
//  HolidaySearch
//
//  Created by Jeroen Dunselman on 23/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import UIKit
import RxSwift

class MyViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
//  var shownCities = [String]() // Data source for UITableView
//  let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"] // Our mocked API data source
  let dates: [DateViewModel] = (UIApplication.shared.delegate as! AppDelegate).readJson()
  var shownDates: [DateViewModel] = []
  let disposeBag = DisposeBag() // Bag of disposables to release them when view is being deallocated
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  func setup() {
    searchBar.autocapitalizationType = UITextAutocapitalizationType.none
    tableView.dataSource = self
    searchBar
      .rx.text // Observable property thanks to RxCocoa
      .orEmpty // Make it non-optional
      .debounce(0.5, scheduler: MainScheduler.instance) // Wait 0.5 for changes.
      .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
      .filter { !$0.isEmpty } // If the new value is really new, filter for non-empty query.
      .subscribe(onNext: { [unowned self] query in // Here we subscribe to every new value, that is not empty (thanks to filter above).
        print(self.searchBar.text!)
        self.shownDates = self.dates.filter { $0.titleText.hasPrefix(query) } // We now do our "API Request" to find cities.
        self.tableView.reloadData() // And reload table view data.
      })
      .addDisposableTo(disposeBag) // Don't forget to add this to disposeBag. We want to dispose it on deinit.
  }
}

// MARK: - UITableViewDataSource
/// Here we have standard data source extension for ViewController
extension MyViewController: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shownDates.count
  }
  
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath)
    let date = shownDates[indexPath.row]
    cell.textLabel?.text = date.titleText //.weekdayText
    cell.detailTextLabel?.text = date.dateText
    cell.backgroundColor = date.dateColour
    
    //    print(date.celebrations[0].colour)
    ////    if let
    ////      let colour = date.celebrations[0].colour
    ////        as? String {
    //      if date.celebrations[0].colour == "red" {
    //        cell.backgroundColor = UIColor.red
    //      }
    //    }
    //    cell.textLabel?.text = carViewModel.titleText
    //    cell.detailTextLabel?.text = carViewModel.horsepowerText
    //    loadImage(cell, photoURL: carViewModel.photoURL as URL?)
    
    return cell
  }
}

//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return shownCities.count
//  }
//  
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cityPrototypeCell", for: indexPath)
//    cell.textLabel?.text = shownCities[indexPath.row]
//    
//    return cell
//  }


