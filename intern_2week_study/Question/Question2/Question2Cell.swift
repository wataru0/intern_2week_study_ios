import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    public func setCell(cellLabel: String, url: URL) {
        label.text = cellLabel
        // Nukeで画像読み込み
        Nuke.loadImage(with: url, into: areaImageView)
    }
    
}
