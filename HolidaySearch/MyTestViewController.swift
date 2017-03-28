//
//  MyTestViewController.swift
//  HolidaySearch
//
//  Created by Jeroen Dunselman on 24/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import UIKit

class MyTestViewController: UIViewController {
  
  func addViewModel() -> AddViewModel {
    return AddViewModel()//coreDataStack: coreDataStack)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let addViewController = AddViewController(viewModel: self.addViewModel())
    addViewController.viewModel.hello()
    // self.view = addViewController.view
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
