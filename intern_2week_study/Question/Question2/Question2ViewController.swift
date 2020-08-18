import Nuke
import UIKit

final class Question2ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        // R.swiftを用いない，nibファイルを登録する方法
        //self.tableView.register(UINib(nibName: "Question2Cell", bundle: nil), forCellReuseIdentifier: "question2Cell")

        // R.swiftを用いた，nibファイルの読み込み
        tableView.register(R.nib.question2Cell)
    }
}

extension Question2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示する行数を指定する
        return areaTexts.count
    }
    
    // セルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cellの作成,R.swiftを使うと簡単になる
//        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "question2Cell") as? Question2Cell else {
//            return Question2Cell()
//        }
        
        // R.swiftを使ったCellの作成
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.question2Cell, for: indexPath) else {
            return Question2Cell()
        }
        
        let imageUrl: String = "https://j-town.net/images/2017/quote-all/town20170314163320.jpg"
        // String -> URL
        guard let imageURL = URL(string: imageUrl) else {
            return Question2Cell()
        }
        cell.setArea(areaTexts[indexPath.row], withImageURL: imageURL)
        
        return cell
    }
}

extension Question2ViewController: UITableViewDelegate {
    // セルタップしたときの処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: areaTexts[indexPath.row], message: "alert!!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        // Alertを表示
        present(alert, animated: true)
        // セルをタップしたときのハイライトを消す
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
    // セルの高さを固定
    // セルが画面外に出ると，大きさが変化しレイアウトが崩れたため．
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
