
import Foundation
import UIKit
import EventKit

class NameDayViewData:NSObject{
//  var celebration: CelebrationViewData
//  var date: Date
//  var event: EKEvent
//  let eventStore = EKEventStore()
  
  init (celebration: CelebrationViewData, date: Date) {
//  , eventStore: EventStore) {
//    celebration = celebration
//    date = date
//    let christianCalendar:EKCalendar = EKCalendar(for: EKEntityType.event, eventStore:eventStore)
    
//    event = EKEvent(eventStore: eventStore)
//    event.title = celebration.title //"Test Title"
//    event.startDate = date //Date()
//    event.endDate = date.addingTimeInterval(24*60*60) //Date()
//    event.notes = celebration.date //"This is a note"
//    event.calendar = eventStore.defaultCalendarForNewEvents
//    do {
//      try eventStore.save(event, span: .thisEvent)
//    } catch let error as NSError {
//      print("failed to save event with error : \(error)")
//    }
//    print("Saved Event \(event.startDate)")
  }
  /**/
 
  
}

protocol NameDayView: NSObjectProtocol {
  //  func startLoading()
  //  func finishLoading()
  //  func setCelebrations(_ celebrations: [CelebrationViewData])
  func setNameDayEvents(_ namedays: [NameDayViewData])
  //  func setEmptyCelebrations()
}

class NameDayPresenter {
  fileprivate let celebrationService:CelebrationService
  //  weak fileprivate var celebrationView : CelebrationView?
  weak fileprivate var calendarView : NameDayView?
  
  init(celebrationService:CelebrationService){
    self.celebrationService = celebrationService
  }
  
  //  func attachView(_ view:CelebrationView) {
  //    celebrationView = view
  //  }
  func attachCalendarView(_ view:NameDayView) {
    calendarView = view
  }
  func detachView() {
    calendarView = nil
  }
  
  func celebrationColour(desc : String) -> UIColor {
    var result :UIColor
    switch desc {
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
    return result
  }
  
  func getDate(date: String = "") -> Date {
    
    let dateFormat: DateFormatter = DateFormatter()
    dateFormat.dateFormat = "yyyy-MM-dd"
    
    var resultDate = Date()
    resultDate = dateFormat.date(from: date)!
    
    return resultDate //
  }
  
  func getNameDays() {


    func addEventToCalendar(title: String, description: String?, startDate: NSDate, endDate: NSDate, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {
      let eventStore = EKEventStore()
      
      eventStore.requestAccess(to: .event, completion: { (granted, error) in
        if (granted) && (error == nil) {
          let event = EKEvent(eventStore: eventStore)
          event.title = title
          event.startDate = startDate as Date
          event.endDate = endDate as Date
          event.notes = description
          event.calendar = eventStore.defaultCalendarForNewEvents
          do {
            try eventStore.save(event, span: .thisEvent)
          } catch let e as NSError {
            completion?(false, e)
            return
          }
          completion?(true, nil)
        } else {
          completion?(false, error as NSError?)
        }
      })
    }
//    let startDate:NSDate = NSDate(timeInterval: -2*24*60*60, since: Date())
//    addEventToCalendar(title: "Girlfriend birthday", description: "Remember or die!", startDate: startDate, endDate: NSDate())
    
    //    NameDay is a titled Celebration
    let mappedCelebrations = celebrationService.parseCelebList()
      .filter{ $0.title.characters.count > 0 }
      .map{
        
        return NameDayViewData(
          celebration: CelebrationViewData(title: "\($0.title)",
            date: "\($0.dateInfo.weekDayText):  \($0.rank)",
            seasonColour: $0.dateInfo.seasonColour,
            celebrationColour: celebrationColour(desc: $0.colourText)),
          date: getDate(date: $0.date))
    }
    self.calendarView?.setNameDayEvents(mappedCelebrations)
  }
}
