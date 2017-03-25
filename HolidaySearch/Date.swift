//
//  Date.swift
//  My JSON read
//
//  Created by Jeroen Dunselman on 22/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import Foundation

class Date {
  var weekday :String
  var date :String
  var season :String
  var seasonWeek :Int
  var celebrations :[Celebration]

  init (weekday: String, date: String, season: String, seasonWeek: Int, celebrations: [Celebration]) {
    self.weekday = weekday
    self.date = date
    self.season = season
    self.celebrations = celebrations
    self.seasonWeek = seasonWeek
//    print(self.weekday, self.season, self.date, self.celebrations[0].title)
  }
}
