//
//  AppDelegate.swift
//  HolidaySearch
//
//  Created by Jeroen Dunselman on 22/03/2017.
//  Copyright © 2017 Jeroen Dunselman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}
/*var celebrations:[Celebration] = []
 
 public func getCelebList() -> [Celebration] {
 return celebrations
 }
 
 public func readJson() -> [DateViewModel] {
 //    var celebs: [Celebration] = []
 var dates: [Date] = []
 var dateVMs: [DateViewModel] = []
 do {
 if let file = Bundle.main.url(forResource: "data", withExtension: "json") {
 let data = try Data(contentsOf: file)
 let json = try JSONSerialization.jsonObject(with: data, options: [])
 //        if let object = json as? [String: Any] {
 //          // json is a dictionary
 //          print(object)
 //        } else
 if let object = json as? [Any] {
 // json is an array
 //          print(object)
 
 for i in 0...object.count-1 {
 if let date = object[i] as? [String: Any] {
 let value = date["date"] as? String
 var celebs:[Celebration] = []
 if let x = date["celebrations"] as? NSArray {
 //              print("Celebrating \n\(x)")
 //              celebrations = x.map{}
 for j in 0...x.count-1 {
 if let celebration = x[j] as? [String: Any] {
 //                  print(celebration)
 let title = celebration["title"] as? String
 let rank = celebration["rank"] as? String
 let rank_num = celebration["rank_num"] as? Double
 let colour = celebration["colour"] as? String
 let celebratedToday = Celebration.init(title: title!, colour: colour!, rank: rank!, num: rank_num!, date: value!)
 celebs.append(celebratedToday)
 celebrations.append(celebratedToday)
 //                  print(title!)
 }
 }
 print(celebrations.count)
 }
 
 //  todo
 //              let season_week = aObject["\"season_week\""] as? String
 //              print(season_week!)
 let weekday = date["weekday"] as? String
 
 let season = date["season"] as? String
 let aDate = Date.init(weekday: weekday!, date: value!, season: season!, celebrations: celebs)
 
 //              print("\nDate: \n")
 //              print(aDate.weekday)
 dates.append(aDate)
 let dateVM = DateViewModel.init(date: aDate)
 dateVMs.append(dateVM)
 }
 }
 } else {
 print("JSON is invalid")
 }
 } else {
 print("no file")
 }
 } catch {
 print(error.localizedDescription)
 }
 
 return dateVMs
 }
*/
