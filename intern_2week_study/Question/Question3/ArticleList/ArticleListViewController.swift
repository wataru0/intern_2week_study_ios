//
//  ArticleListViewController.swift
//  intern_2week_study
//
//  Created by 岡本航昇 on 2020/08/18.
//  Copyright © 2020 caraquri. All rights reserved.
//
import SafariServices
import UIKit

class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // 用意されているArticle型を使う
    private var articles: [Article] = []
    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.register(R.nib.articleListCell)
    }
    
    static func makeInstance(_ articles: [Article]) -> ArticleListViewController {
        let articleListViewController = R.storyboard.articleListView.instantiateInitialViewController()!
        articleListViewController.articles = articles
        return articleListViewController
    }
}

extension ArticleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.articleListCell, for: indexPath), let article = articles[safe: indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.set(article)
        
        return cell
    }
    
}
extension ArticleListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let urlString = articles[safe: indexPath.row]?.url, let url = URL(string: urlString) else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
