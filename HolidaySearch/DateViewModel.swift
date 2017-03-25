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
//    if ( as String?) != nil {
    if date.celebrations[0].title.characters.count > 0 {
      return UIColor.white
    }
    return UIColor.gray
  }
  
  var seasonColour: UIColor {
    
    var result :UIColor
    switch date.season {
    case "ordinary":
      result = UIColor.gray
    case "advent":
      result = UIColor.lightGray
    case "christmas":
      result = UIColor.white
    default :
      result = UIColor.black
    }
    return  result
  }
  
  var dateText: String {
    return "\(date.date) \(weekDayText)"
  }
  
  var weekDayText: String {
    return "\(date.date) - \(self.seasonText) \(date.weekday)"
  }
  
  var searchText: String {
    return date.weekday
  }
  
  var seasonText: String {
    var result = ""
    if date.season != "ordinary" {
      result = "season of \(date.season)"
    }
    return result
  }
//  var horsepowerText: String {
//    let horsepower = Int(round(Double(date.) * DateViewModel.horsepowerPerKilowatt))
//    return "\(horsepower) HP"
//  }
  
  var titleText: String {
//    var result = ""
//    let title:String = "\(date.celebrations[0].title)"
//    if title.characters.count > 0 {
//      result = title
//    }
    return "\(date.celebrations[0].title)" //result
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
