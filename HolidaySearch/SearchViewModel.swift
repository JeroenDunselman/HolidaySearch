//
//  SearchViewModel.swift
//  HolidaySearch
//
//  Created by Jeroen Dunselman on 22/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import RxSwift

struct SearchViewModel {
  
  var username = Variable<String>("")
  var password = Variable<String>("")
  
//  var isValid : Observable<Bool>{
//    return Observable.combineLatest( self.username, self.password)
//    { (username, password) in
//      return
//      username.characters.count > 0
//        && password.characters.count > 0
//    }
//  }
  
//  init
//  let validSearchSignal = RACObserve(self, keyPath: "searchText").mapAs {
//    (text: NSString) -> NSNumber in
//    return text.length > 3
//    }.distinctUntilChanged();
}
