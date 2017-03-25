//
//  HolidayNameSearchViewController.swift
//  HolidaySearch
//
//  Created by Jeroen Dunselman on 24/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import UIKit
import RxSwift
class HolidayNameSearchViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  var celebrations: [Celebration] = []
  var shownCelebrations: [Celebration] = []
  let disposeBag = DisposeBag() // Bag of disposables to release them when view is being deallocated
  
//  init(viewModel:FlickrSearchViewModel) {
//    self.viewModel = viewModel
//    
////    super.init(nibName: "FlickrSearchViewController", bundle: nil)
//    super.init(nibName: "MyTestViewController", bundle: nil)
//    
//    edgesForExtendedLayout = .None
//  }

  override func viewDidLoad() {
    super.viewDidLoad()
    let source = CelebrationService()
    celebrations = source.parseCelebList()
    setup()
        //    let addViewController = AddViewController(viewModel: self.viewModel.addViewModel())
  }
  
  func setup() {
    searchBar.autocapitalizationType = UITextAutocapitalizationType.none
    tableView.dataSource = self
    searchBar
      .rx.text // Observable property thanks to RxCocoa
      .orEmpty // Make it non-optional
      .debounce(0.5, scheduler: MainScheduler.instance) // Wait 0.5 for changes.
      .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
//      .filter { !$0.isEmpty } // If the new value is really new, filter for non-empty query.
      .subscribe(onNext: { [unowned self] searchtext in
        // Here we subscribe to every new value, show all if searchtext empty, else query
        self.shownCelebrations = !searchtext.isEmpty ?
          self.celebrations.filter { $0.title.contains(searchtext) } :
          self.celebrations
        
        self.tableView.reloadData() // And reload table view data.
      })
      .addDisposableTo(disposeBag) // Don't forget to add this to disposeBag. We want to dispose it on deinit.
  }
}

// MARK: - UITableViewDataSource
/// Here we have standard data source extension for ViewController
extension HolidayNameSearchViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shownCelebrations.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CelebrationCell", for: indexPath)
    let celeb = shownCelebrations[indexPath.row]
    cell.textLabel?.text = celeb.title //.weekdayText
    cell.detailTextLabel?.text = "\(celeb.date)   \(celeb.rank)"
//    cell.backgroundColor = 
    
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
