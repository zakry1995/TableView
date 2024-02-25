import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let coffees: [Coffee] = [
        Coffee(name: "Espresso", detail: "Strong coffee brewed by forcing a small amount of nearly boiling water through finely ground coffee beans."),
        Coffee(name: "Cappuccino", detail: "A coffee-based drink made primarily from espresso and milk."),
        Coffee(name: "Latte", detail: "A coffee drink made with espresso and steamed milk."),
        Coffee(name: "Americano", detail: "Espresso with added hot water."),
        Coffee(name: "Cortado", detail: "Equal parts espresso and warm milk to reduce the acidity."),
        Coffee(name: "Macchiato", detail: "Espresso with a small amount of milk."),
        Coffee(name: "Mocha", detail: "Espresso with steamed milk and chocolate."),
        Coffee(name: "Affogato", detail: "Espresso poured over a scoop of vanilla ice cream."),
        Coffee(name: "Flat White", detail: "Espresso with steamed milk foam."),
        Coffee(name: "Irish Coffee", detail: "Coffee combined with whiskey and cream.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCoffeeDetail", let indexPath = tableView.indexPathForSelectedRow {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.coffee = coffees[indexPath.row]
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = coffees[indexPath.row].name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCoffeeDetail", sender: self)
    }
}
