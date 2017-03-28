//
//  CelebrationViewCell.swift
//  HolidaySearch
//
//  Created by Jeroen Dunselman on 26/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.

import UIKit

class CelebrationViewCell: UITableViewCell {
  @IBOutlet weak var viewCelebration: UIView!
  @IBOutlet weak var viewSeason: UIView!
  @IBOutlet weak var textDescription: UILabel!

  @IBOutlet weak var textCelebration: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
