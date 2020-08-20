import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func pushSearchButton() {
        searchArticles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // プレースホルダーの設定
        textField.placeholder = "キーワードを入力して検索"
        
        textField.delegate = self
    }
    
    func searchArticles() {
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        // ボタン無効
        searchButton.isEnabled = false
        
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
    }
    
    func showArticleListScreen(_ articles: [Article]) {
        // ArticleListViewインスタンス作成
        let articleListViewController = ArticleListViewController.makeInstance(articles)
        // 遷移
        navigationController?.pushViewController(articleListViewController, animated: true)
    }
}

// returnキーで検索
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        // 検索
        searchArticles()
        return true
    }
}
