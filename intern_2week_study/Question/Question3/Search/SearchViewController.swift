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
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        APIClient.fetchArticles(keyword: text) { [weak self] result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self?.showArticleListScreen(articles)
                    
                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self?.present(alert, animated: true)
                }
                self?.searchButton.isEnabled = true
            }
        }
        
        //showArticleListScrenn()
    }
    
    func showArticleListScreen(_ articles: [Article]) {
        // ArticleListViewインスタンス作成
        let articleListViewController = ArticleListViewController.makeInstance(articles)
        // 遷移
        navigationController?.pushViewController(articleListViewController, animated: true)
    }
}
