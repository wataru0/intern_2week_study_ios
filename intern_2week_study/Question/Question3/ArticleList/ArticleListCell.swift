//
//  ArticleListCell.swift
//  intern_2week_study
//
//  Created by 岡本航昇 on 2020/08/18.
//  Copyright © 2020 caraquri. All rights reserved.
//
import Nuke
import UIKit

class ArticleListCell: UITableViewCell {

    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var articleTitleTextLabel: UILabel!
    @IBOutlet weak var lgtmTextLabel: UILabel!
    
    func set(_ article: Article) {
        articleTitleTextLabel.text = article.title
        articleTitleTextLabel.backgroundColor = .green
        
        lgtmTextLabel.text = "LGTM : " + String(article.likesCount)
        lgtmTextLabel.backgroundColor = .gray
        
        let imageUrl: String = "https://j-town.net/images/2017/quote-all/town20170314163320.jpg"
        // String -> URL
        guard let url = URL(string: imageUrl) else {
            return
        }
        // Nukeで画像読み込み
        Nuke.loadImage(with: url, into: userIconImageView)
    }
}
