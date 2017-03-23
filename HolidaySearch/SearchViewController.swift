//
//  SearchViewController.swift
//  HolidaySearch
//
//  Created by Jeroen Dunselman on 23/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation
import UIKit

class SearchViewController {

  @IBOutlet weak var searchBar: UISearchBar!


}
//var usernameTextField: UITextField!
//var passwordTextField: UITextField!
//var confirmButton: UIBUtton!
//
//var viewModel = SearchViewModel()
//
//var disposeBag = DisposeBag()
//
//override func viewDidLoad(){
//  super.viewDidLoad()
//  usernameTextField.rx.text.bindTo(viewModel.username).addTo(disposeBag)
//  passwordTextField.rx.text.bindTo(viewModel.password).addTo(disposeBag)
//  
//  //from the viewModel
//  viewModel.rx.isValid.map{ $0 }
//    .bindTo(confirmButton.rx.isEnabled)
//}
