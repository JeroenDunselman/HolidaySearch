//
//You are not allowed to write any production code unless it is to make a failing unit test pass.
//You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures.
//You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

//
//  DateViewModelTest.swift
//  HolidaySearch
//
//  Created by Jeroen Dunselman on 27/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import XCTest
@testable import HolidaySearch

class DateViewModelTest: XCTestCase {
  
  func testSeasonShouldReturnEmptyIfOrdinary() {
    
    //given
    let season:String = "ordinary"
    let date = Day(weekday: "", date: "", season: season, seasonWeek: 0, celebrations: [Celebration]())
    
    let resultColor = UIColor.clear
    let resultDesc:String = ""
    
    //when
    let testViewModel = DayViewModel(date: date)
    let colorTest:UIColor = testViewModel.seasonColour
    let descriptionTest:String = testViewModel.seasonText
    
    //verify
    XCTAssertEqual(colorTest, resultColor)
    XCTAssertEqual(descriptionTest, resultDesc)
  }
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
