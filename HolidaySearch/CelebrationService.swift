
import Foundation


class CelebrationService {
  var celebrations:[Celebration] = []
  //the service delivers 'data.json' data with a delay
  func getCelebrations(_ callBack:@escaping ([Celebration]) -> Void){

    let celebrations: [Celebration] = parseCelebList()
    let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
      DispatchQueue.main.asyncAfter(deadline: delayTime) {
        callBack(celebrations)
      }
  }
  
  func parseCelebList() -> [Celebration] {
    _ = readJson()
    return celebrations
  }
  
  func readJson() -> [DateViewModel] {
    //    var celebs: [Celebration] = []
    var dates: [Date] = []
    var dateVMs: [DateViewModel] = []
    
    do {
      if let file = Bundle.main.url(forResource: "data", withExtension: "json") {
        let data = try Data(contentsOf: file)
        let json = try JSONSerialization.jsonObject(with: data, options: [])

        if let object = json as? [Any] {
          for i in 0...object.count-1 {
            
            if let date = object[i] as? [String: Any] {
              
              let value = date["date"] as? String
              let weekday = date["weekday"] as? String
              let season = date["season"] as? String
              let seasonWeek = date["season_week"] as? Int
              var dateCelebrations:[Celebration] = []
              
              let aDate = Date.init(weekday: weekday!, date: value!, season: season!, seasonWeek: seasonWeek!, celebrations: dateCelebrations)
              
              if let x = date["celebrations"] as? NSArray {
                //              print("Celebrating \n\(x)")
                //              celebrations = x.map{}
                for j in 0...x.count-1 {
                  if let c = x[j] as? [String: Any] {
                    //                  print(celebration)
                    let title = c["title"] as? String
                    let rank = c["rank"] as? String
                    let rank_num = c["rank_num"] as? Double
                    let colour = c["colour"] as? String
                    let dateVM : DateViewModel = DateViewModel.init(date:aDate)
                    
                    let celebration = Celebration.init(title: title!, colour: colour!, rank: rank!, num: rank_num!, dateText: value!, dateInfo: dateVM)
                    dateCelebrations.append(celebration)
                    celebrations.append(celebration)
                    //                  print(title!)
                  }
                }
//                print(celebrations.count)
              }
              aDate.celebrations = dateCelebrations
              
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
}

//class  UserService {
//
//    //the service delivers mocked data with a delay
//    func getUsers(_ callBack:@escaping ([User]) -> Void){
//        let users = [User(firstName: "Iyad", lastName: "Agha", email: "iyad@test.com", age: 36),
//                     User(firstName: "Mila", lastName: "Haward", email: "mila@test.om", age: 24),
//                     User(firstName: "Mark", lastName: "Astun", email: "mark@test.com", age: 39)
//        ]
//        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
//        DispatchQueue.main.asyncAfter(deadline: delayTime) {
//            callBack(users)
//        }
//    }
//}
