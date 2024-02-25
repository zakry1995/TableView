import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailLabel: UILabel!
    var coffee: Coffee?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = coffee?.name // Set the title of the navigation bar to the coffee name.
        detailLabel.text = coffee?.detail
    }
}
