//
//  DateViewModel.swift
//  HolidayTable
//
//  Created by Jeroen Dunselman on 23/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// class CarViewModel {
// ...

class DateViewModel {
  let disposeBag = DisposeBag()
  fileprivate var date: Date
  //  static let horsepowerPerKilowatt = 1.34102209
//  var dateWeekdayText: BehaviorSubject<String>
  
  var dateColour: UIColor {
    return UIColor.gray
  }
  
  var dateText: String {
    return date.date
  }
  
  var weekdayText: String {
    return date.weekday
  }
  
  var seasonText: String {
    return date.season
  }
//  var horsepowerText: String {
//    let horsepower = Int(round(Double(date.) * DateViewModel.horsepowerPerKilowatt))
//    return "\(horsepower) HP"
//  }
  
  var titleText: String {
    return "\(date.weekday) \(date.celebrations[0].title)"
  }
  
//  var photoURL: URL? {
//    return URL(string: date.photoURL)
//  }
  
  init(date: Date) {
    self.date = date
//    // 1
//    dateWeekdayText = BehaviorSubject<String>(value: date.weekday) // initializing with the current value of car.model
//    dateWeekdayText.subscribe { (weekday) in
//      date.weekday = weekday                                   // subscribing to changes in modelText which will be reflected in CarViewModel's car
//      }.addDisposableTo(disposeBag)
//
//    // 1
//    modelText = BehaviorSubject<String>(value: car.model) // initializing with the current value of car.model
//    modelText.subscribeNext { (model) in
//      car.model = model                                   // subscribing to changes in modelText which will be reflected in CarViewModel's car
//      }.addDisposableTo(disposeBag)
  }
}
