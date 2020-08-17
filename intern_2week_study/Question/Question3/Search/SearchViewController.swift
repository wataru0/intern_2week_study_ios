import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func pushSearchButton() {
        searchArticles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func searchArticles() {
        
    }
}
