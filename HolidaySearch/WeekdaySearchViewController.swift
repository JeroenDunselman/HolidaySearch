//
//  MyViewController.swift
//  HolidaySearch
//
//  Created by Jeroen Dunselman on 23/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import UIKit
import RxSwift

class WeekdaySearchViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var days: [DayViewModel] = []
  var shownDays: [DayViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let source = CelebrationService()
    days = source.readJson()
    tableView.dataSource = self
    setupSearchBar()
  }
  
  let disposeBag = DisposeBag()
  func setupSearchBar() {
    searchBar.autocapitalizationType = UITextAutocapitalizationType.none

    searchBar
      .rx.text
      .orEmpty
      .debounce(0.5, scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      .filter { !$0.isEmpty }
      .subscribe(onNext: { [unowned self] query in
        print(self.searchBar.text!)
        self.shownDays = self.days.filter { $0.searchText.hasPrefix(query) }
        self.tableView.reloadData()
      })
      .addDisposableTo(disposeBag)
      }
}

extension WeekdaySearchViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shownDays.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath)
    let day = shownDays[indexPath.row]
    cell.textLabel?.text = day.titleText
    cell.detailTextLabel?.text = day.weekDayText
    cell.backgroundColor = day.dateColour
    
    //    loadImage(cell, photoURL: carViewModel.photoURL as URL?)
    return cell
  }
}


