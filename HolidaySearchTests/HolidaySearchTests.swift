//
//  HolidaySearchTests.swift
//  HolidaySearchTests
//
//  Created by Jeroen Dunselman on 22/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import XCTest
@testable import HolidaySearch

class CelebrationServiceMock: CelebrationService {
  let celebs: [Celebration]
  init(celebrations: [Celebration]) {
    self.celebs = celebrations
  }
  override func getCelebrations(_ callBack: @escaping ([Celebration]) -> Void) {
    callBack(celebs)
  }
  
}

class CelebrationViewMock : NSObject, CelebrationView{
  var setCelebrationsCalled = false
  var setEmptyCelebrationsCalled = false
  
  func setCelebrations(_ celebrations: [CelebrationViewData]) {
    setCelebrationsCalled = true
  }
  
  func setEmptyCelebrations() {
    setEmptyCelebrationsCalled = true
  }
  
  func startLoading() {
  }
  
  func finishLoading() {
  }
  
}

class HolidaySearchTests: XCTestCase {
    
  let emptyCelebrationsServiceMock = CelebrationServiceMock(celebrations:[Celebration]())
  
  var date:Day
  var towCelebrationsServiceMock: CelebrationServiceMock
  override init() {
    
    date = Day(weekday: "wednesday", date: "2017-03-27", season: "ordinary", seasonWeek: 12, celebrations: [Celebration]())
    
    towCelebrationsServiceMock = CelebrationServiceMock(celebrations:[
      Celebration(title: "celebration1", colour: "green", rank: "ordinary", num: 3.12, dateText: "2017-03-27", dateInfo: DayViewModel(date: date)),
      Celebration(title: "celebration2", colour: "red", rank: "solemnity", num: 1.3, dateText: "2017-03-27", dateInfo: DayViewModel(date: date))
      ])
    super.init()
  }
  
  func testShouldSetEmptyIfNoCelebrationAvailable() {
    //given
    let celebrationViewMock = CelebrationViewMock()
    let celebrationPresenterUnderTest = CelebrationPresenter(celebrationService: emptyCelebrationsServiceMock)
    celebrationPresenterUnderTest.attachView(celebrationViewMock)
    
    //when
    celebrationPresenterUnderTest.getCelebrations()
    
    //verify
    XCTAssertTrue(celebrationViewMock.setEmptyCelebrationsCalled)
  }
  
  func testShouldSetCelebrations() {
    //given
    let celebrationViewMock = CelebrationViewMock()
    let celebrationPresenterUnderTest = CelebrationPresenter(celebrationService: towCelebrationsServiceMock)
    celebrationPresenterUnderTest.attachView(celebrationViewMock)
    
    //when
    celebrationPresenterUnderTest.getCelebrations()
    
    //verify
    XCTAssertTrue(celebrationViewMock.setCelebrationsCalled)
  }
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
}

