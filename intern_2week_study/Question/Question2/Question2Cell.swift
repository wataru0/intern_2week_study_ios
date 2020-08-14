import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    public func setCell(cellLabel: String, url: String) {
        label.text = cellLabel
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        // Nukeで画像読み込み
        Nuke.loadImage(with: imageUrl, into: areaImageView)
    }
    
}
