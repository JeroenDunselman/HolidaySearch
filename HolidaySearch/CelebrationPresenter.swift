
import Foundation
import UIKit
import RxSwift

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
  //  func selectCelebrations()
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
  
  var searchText:String = ""
  fileprivate var celebrationsAll : [CelebrationViewData] = [CelebrationViewData]()
  fileprivate var celebrationsInQuery : [CelebrationViewData] = [CelebrationViewData]()
  fileprivate var celebrationsToDisplay : [CelebrationViewData] = [CelebrationViewData]()
  let disposeBag = DisposeBag()
  func setupSearchBar(searchBar: UISearchBar) {
    searchBar.autocapitalizationType = UITextAutocapitalizationType.none
    
    searchBar
      .rx.text
      .orEmpty
      .debounce(0.5, scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      .subscribe(onNext: { [unowned self] searchText in
        // Show all if searchtext empty, else query
        //self.celebrationPresenter.detachView()
        self.searchText = searchText
        self.celebrationsToDisplay = searchText.isEmpty ?
          self.celebrationsInQuery :
          self.celebrationsInQuery.filter { $0.title.contains(searchText) }
//        self.celebrationPresenter.attachView(self.)
//        self.celebrationView?.reloadData()
        if self.celebrationsToDisplay.count > 0 {
          self.celebrationView?.setCelebrations(self.celebrationsToDisplay)
        } else {
          self.celebrationView?.setEmptyCelebrations()
        }
      })
      .addDisposableTo(disposeBag)
  }
  
  
  fileprivate var celebrationsNameDaysOnly : [CelebrationViewData] = [CelebrationViewData]()
  func setupSwitchNameDays(switchNameDays: UISwitch) {
    switchNameDays.rx.value.subscribe(onNext: { [unowned self] switchValue in
      //All celebration or filtered namedays
      self.celebrationsToDisplay = switchValue ? self.celebrationsAll :
        (self.searchText.characters.count == 0 ? self.celebrationsNameDaysOnly : self.celebrationsNameDaysOnly
        .filter{$0.title.contains(self.searchText)})
      self.celebrationView?.setCelebrations(self.celebrationsToDisplay)
    } ).addDisposableTo(disposeBag)
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
  
  //init
  func getCelebrations() {
    let mappedCelebrations = celebrationService.parseCelebList().map{
      return CelebrationViewData(
        title: "\($0.title)",
        date: "\($0.dateInfo.weekDayText):  \($0.rank)",
        seasonColour: $0.dateInfo.seasonColour,
        celebrationColour: celebrationColour(desc: $0.colourText))
    }
    self.celebrationView?.setCelebrations(mappedCelebrations)
    self.celebrationsAll = mappedCelebrations
    self.celebrationsNameDaysOnly = celebrationsAll.filter{$0.title.characters.count>0}
    self.celebrationsInQuery = self.celebrationsAll
  }
  
}
