import Nuke
import UIKit

final class Question2ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //private let url = URL(String: "https://pixabay.com/api/")
    private let key = "17880579-7929bd21349a1518f7cd6a827"
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        //  Identifier 設定
        self.tableView.register(UINib(nibName: "Question2Cell", bundle: nil), forCellReuseIdentifier: "question2Cell")
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
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "question2Cell") as? Question2Cell else {
            return Question2Cell()
        }
        //cell.textLabel?.text = areaTexts[indexPath.row]
        
        guard let imageUrl = URL(string: "https://placehold.jp/150x150.png") else {
            return Question2Cell()
        }
        cell.setCell(cellLabel: areaTexts[indexPath.row], url: imageUrl)
        
        return cell
    }
    
    // 画像を取得
    func getPixabayImages() {
        
    }
}
