
import Foundation
import UIKit
struct CelebrationViewData{
    let title: String
    let date: String
    let colour: UIColor
    let seasonColour: UIColor
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
    
    init(celebrationService:CelebrationService){
        self.celebrationService = celebrationService
    }
    
    func attachView(_ view:CelebrationView) {
        celebrationView = view
    }
    
    func detachView() {
        celebrationView = nil
    }
    
    func getCelebrations() {
      
        self.celebrationView?.startLoading()
        celebrationService.getCelebrations{ [weak self] celebrations in
//          var titleText : String = ""
            self?.celebrationView?.finishLoading()
            if(celebrations.count == 0) {
                self?.celebrationView?.setEmptyCelebrations()
            } else {
                let mappedCelebrations = celebrations.map{
                  
//             titleText = $0.title
                  //              $0.title.characters.count = 0 ? "" : "Celebrating \($0.title)"
                  return CelebrationViewData(title: "\($0.title)",
                    date: "\($0.dateInfo.weekDayText):  \($0.rank)",
                    colour: $0.colour,
                    seasonColour: $0.dateInfo.seasonColour)
                }
                self?.celebrationView?.setCelebrations(mappedCelebrations)
            }
        }
    }
}
