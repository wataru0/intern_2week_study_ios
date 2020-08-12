import Nuke
import UIKit

final class Question2ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension Question2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示する行数を指定する
        return areaTexts.count
    }
    // セルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Cellの作成
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = areaTexts[indexPath.row]
        
        return cell
        // 仮のセル
        //return UITableViewCell()
    }
}
