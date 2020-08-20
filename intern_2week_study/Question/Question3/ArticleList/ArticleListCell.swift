import Nuke
import UIKit

class ArticleListCell: UITableViewCell {

    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var articleTitleTextLabel: UILabel!
    @IBOutlet weak var lgtmTextLabel: UILabel!
    
    func set(_ article: Article) {
        articleTitleTextLabel.text = article.title
        
        lgtmTextLabel.text = "LGTM : " + String(article.likesCount)

        // articleからアイコン情報(String)を取得
        // String -> URL
        guard let iconImageUrl = article.user?.profileImageUrl, let url = URL(string: iconImageUrl) else {
            return
        }
        
        // Nukeで画像読み込み
        Nuke.loadImage(with: url, into: userIconImageView)
    }
}
