import Nuke
import UIKit

final class Question2ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        //  Identifier 設定
        self.tableView.register(UINib(nibName: "Question2Cell", bundle: nil), forCellReuseIdentifier: "question2Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        //let imageUrl: String = "https://placehold.jp/150x150.png"
        let imageUrl: String = "https://j-town.net/images/2017/quote-all/town20170314163320.jpg"
        cell.setCell(cellLabel: areaTexts[indexPath.row], url: imageUrl)
        
        return cell
    }
}

extension Question2ViewController: UITableViewDelegate {
    // セルタップしたときの処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: areaTexts[indexPath.row], message: "alert!!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_ action: UIAlertAction!) -> Void in
            print("ok")
        }))
        
        // Alertを表示
        present(alert, animated: true, completion: nil)
        // セルをタップしたときのハイライトを消す
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // ヘッダーの大きさ
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    // フッターの大きさ
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    // セルの高さを固定
    // セルが画面外に出ると，大きさが変化しレイアウトが崩れたため．
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
