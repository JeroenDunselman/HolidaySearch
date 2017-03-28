//
//  DateViewModel.swift
//  HolidayTable
//
//  Created by Jeroen Dunselman on 23/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.

import Foundation
import RxSwift
import RxCocoa

class CelebrationViewModel {
  let disposeBag = DisposeBag()
  var celebration: Celebration
  
  public var celebrationColour: UIColor {
    var result :UIColor = UIColor.black
    switch celebration.colourText {
    case "red":
      result = UIColor.red
    case "green":
      result = UIColor.green
    case "white":
      result = UIColor.white
    case "violet":
      result = UIColor.orange
    default :
      result = UIColor.gray
    }
    return result
  }
  
  var dateText: String {
    return "\(celebration.dateInfo.weekDayText)"
//    \(celebration.dateInfo.seasonText) 
  }
  
  var titleText: String {
    return "\(celebration.title)" //result
  }
  
  init(celebration: Celebration) {
    self.celebration = celebration
  }
}


// class CarViewModel {
// ...
//  static let horsepowerPerKilowatt = 1.34102209
//  var dateWeekdayText: BehaviorSubject<String>
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
//  var photoURL: URL? {
//    return URL(string: date.photoURL)
//  }
//  var dateColour: UIColor {
////    if ( as String?) != nil {
//    if celebration.title.characters.count > 0 {
//      return UIColor.white
//    }
//    return UIColor.gray
//  }
