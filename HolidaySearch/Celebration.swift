//
//  Celebration.swift
//  My JSON read
//
//  Created by Jeroen Dunselman on 22/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import Foundation

public class Celebration {

  let title :String
  let colourText :String
  let rank :String
  let num :Double
  let date :String
  let dateInfo :DayViewModel
  
  init (title: String, colour: String, rank: String, num: Double, dateText: String, dateInfo: DayViewModel) {
    self.title = title
    self.colourText = colour
    self.rank = rank
    self.num = num
    self.date = dateText
    self.dateInfo = dateInfo
  }
  
}
