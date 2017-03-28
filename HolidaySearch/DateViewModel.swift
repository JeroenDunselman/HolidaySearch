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

class DayViewModel {
  fileprivate var date: Day
  
  var dateColour: UIColor {
    if date.celebrations[0].title.characters.count > 0 {
      return UIColor.white
    }
    return UIColor.gray
  }
  
  var seasonColour: UIColor {
    
    var result :UIColor
    switch date.season {
    case "ordinary":
      result = UIColor.clear
    case "advent":
      result = UIColor.purple
    case "christmas":
      result = UIColor.yellow
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

  var titleText: String {
    return "\(date.celebrations[0].title)"
  }
  
  init(date: Day) {
    self.date = date
  }
}
