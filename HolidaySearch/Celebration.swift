//
//  Celebration.swift
//  My JSON read
//
//  Created by Jeroen Dunselman on 22/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import Foundation
// represents a single photo in a Flickr search
public class Celebration {
  
  let title :String
  let colour :String
  let rank :String
  let num :Double
  
  init (title: String, colour: String, rank: String, num: Double) {
    self.title = title
    self.colour = colour
    self.rank = rank
    self.num = num
  }
  
}
