
import Foundation
import UIKit

struct CelebrationViewData{
  let title: String
  let date: String
  let seasonColour: UIColor
  let celebrationColour: UIColor
}

protocol CelebrationView: NSObjectProtocol {
  func startLoading()
  func finishLoading()
  func setCelebrations(_ celebrations: [CelebrationViewData])
  func setEmptyCelebrations()
}

class CelebrationPresenter {
  fileprivate let celebrationService:CelebrationService
  weak fileprivate var celebrationView : CelebrationView?
  weak fileprivate var calendarView : NameDayView?
 
  init(celebrationService:CelebrationService){
    self.celebrationService = celebrationService
  }
  
  func attachView(_ view:CelebrationView) {
    celebrationView = view
  }

  func detachView() {
    celebrationView = nil
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
  
  func getCelebrations() {
    let mappedCelebrations = celebrationService.parseCelebList().map{
      return CelebrationViewData(title: "\($0.title)",
        date: "\($0.dateInfo.weekDayText):  \($0.rank)",
        seasonColour: $0.dateInfo.seasonColour,
        celebrationColour: celebrationColour(desc: $0.colourText))
    }
    self.celebrationView?.setCelebrations(mappedCelebrations)
  }

}
