import UIKit
import RxSwift

class CelebrationViewController: UIViewController {
  
//  @IBAction func switchChange(_ sender: Any) {
//    if(sender.isOn){
//      self.searchBar.text = ""
//    }
//  }
  @IBOutlet weak var switchNamedays: UISwitch!
  @IBOutlet weak var emptyView: UIView?
  @IBOutlet weak var tableView: UITableView?
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
  @IBOutlet weak var searchBar: UISearchBar!
  
  fileprivate let celebrationPresenter = CelebrationPresenter(celebrationService: CelebrationService())
//  fileprivate var celebrationsAll : [CelebrationViewData] = [CelebrationViewData]()
  fileprivate var celebrationsToDisplay : [CelebrationViewData] = [CelebrationViewData]()
  func switchValueDidChange(sender:UISwitch!) {
    if sender.isOn {
//      switchState.text = "UISwitch is ON"
      self.searchBar.text = ""
    } else {
//      switchState.text = "UISwitch is OFF"
      
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView?.dataSource = self
    tableView?.keyboardDismissMode = .onDrag
    
    activityIndicator?.hidesWhenStopped = true
//    switchNamedays.addTarget(self, action: #selector(self.switchIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
    
    switchNamedays.addTarget(self, action: #selector(self.switchValueDidChange(sender:)), for: .valueChanged)

    celebrationPresenter.attachView(self)
    celebrationPresenter.getCelebrations()
    celebrationPresenter.setupSearchBar(searchBar: self.searchBar)
    celebrationPresenter.setupSwitchNameDays(switchNameDays: self.switchNamedays)
  }
}

extension CelebrationViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return celebrationsToDisplay.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CelebCell", for: indexPath) as! CelebrationViewCell
    
    let celebrationViewData = celebrationsToDisplay[indexPath.row]
    
    cell.textCelebration?.text = celebrationViewData.title
    cell.textDescription?.text = celebrationViewData.date
    cell.viewCelebration?.backgroundColor = celebrationViewData.celebrationColour
    cell.viewSeason?.backgroundColor = celebrationViewData.seasonColour
    cell.textCelebration?.shadowColor = celebrationViewData.celebrationColour
    
    cell.textCelebration.isHidden = celebrationViewData.title.characters.count == 0 ? true : false
    
    return cell
  }
  
}

extension CelebrationViewController: CelebrationView {
  
  func startLoading() {
    activityIndicator?.startAnimating()
    //todo
    self.tableView?.isHidden = true
  }
  
  func finishLoading() {
    activityIndicator?.stopAnimating()
    self.tableView?.isHidden = false
  }
  
  func setCelebrations(_ celebrations: [CelebrationViewData]) {

    celebrationsToDisplay = celebrations
//    celebrationsAll = celebrations
    tableView?.isHidden = false
    emptyView?.isHidden = true;
    tableView?.reloadData()
  }
  
  func setEmptyCelebrations() {
    tableView?.isHidden = true
    emptyView?.isHidden = false;
  }
  
  
}


/* moved to presenter
 let disposeBag = DisposeBag()
 func setupSearchBar() {
 searchBar.autocapitalizationType = UITextAutocapitalizationType.none
 
 searchBar
 .rx.text
 .orEmpty
 .debounce(0.5, scheduler: MainScheduler.instance)
 .distinctUntilChanged()
 .subscribe(onNext: { [unowned self] searchtext in
 // Show all if searchtext empty, else query
 //        self.celebrationPresenter.detachView()
 self.celebrationsToDisplay = searchtext.isEmpty ?
 self.celebrationsAll :
 self.celebrationsAll.filter { $0.title.contains(searchtext) }
 //        self.celebrationPresenter.attachView(self.)
 self.tableView?.reloadData()
 })
 .addDisposableTo(disposeBag)
 }
 */
