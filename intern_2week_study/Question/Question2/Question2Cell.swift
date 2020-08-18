import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    public func setArea(_ areaName: String, withImageURL url: URL) {
        label.text = areaName
        
        // Nukeで画像読み込み
        Nuke.loadImage(with: url, into: areaImageView)
    }
}
