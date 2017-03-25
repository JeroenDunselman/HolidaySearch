//
//  Celebration.swift
//  My JSON read
//
//  Created by Jeroen Dunselman on 22/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import Foundation
import UIKit
// represents a single photo in a Flickr search
public class Celebration {

  let title :String
  let colourText :String
  let rank :String
  let num :Double
  let date :String
  let colour : UIColor
  let dateInfo :DateViewModel
  
  init (title: String, colour: String, rank: String, num: Double, dateText: String, dateInfo: DateViewModel) {
    self.title = title
    self.colourText = colour
    self.rank = rank
    self.num = num
    self.date = dateText
    self.dateInfo = dateInfo
    
    var result :UIColor = UIColor.black
    switch colour {
    case "red":
      result = UIColor.red
    case "green":
      result = UIColor.green
    case "white":
      result = UIColor.yellow
    case "violet":
      result = UIColor.purple
    default :
      result = UIColor.gray
    }
    self.colour = result
  }
  
}
