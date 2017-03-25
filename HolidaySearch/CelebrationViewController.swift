import UIKit

class CelebrationViewController: UIViewController {

    @IBOutlet weak var emptyView: UIView?
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    fileprivate let celebrationPresenter = CelebrationPresenter(celebrationService: CelebrationService())
    fileprivate var celebrationsToDisplay = [CelebrationViewData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        activityIndicator?.hidesWhenStopped = true

        celebrationPresenter.attachView(self)
        celebrationPresenter.getCelebrations()
    }

}

extension CelebrationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celebrationsToDisplay.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "UserCell")
        let celebrationViewData = celebrationsToDisplay[indexPath.row]
        cell.textLabel?.text = celebrationViewData.title
        cell.detailTextLabel?.text = celebrationViewData.date
        cell.backgroundColor = celebrationViewData.seasonColour
      cell.detailTextLabel?.shadowColor = celebrationViewData.colour
      cell.textLabel?.shadowColor = celebrationViewData.colour
      
      return cell
    }

}

extension CelebrationViewController: CelebrationView {

    func startLoading() {
        activityIndicator?.startAnimating()
    }

    func finishLoading() {
        activityIndicator?.stopAnimating()
    }

    func setCelebrations(_ celebrations: [CelebrationViewData]) {
        celebrationsToDisplay = celebrations
        tableView?.isHidden = false
        emptyView?.isHidden = true;
        tableView?.reloadData()
    }

    func setEmptyCelebrations() {
        tableView?.isHidden = true
        emptyView?.isHidden = false;
    }


}

