import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var warningLabel: UILabel!
    
    // var to store the textField's text
    var tmpText: String = ""
    
    // process of pushing a addButton
    @IBAction func pushButton() {
        // get textFeild's text
        tmpText = textField.text!
        
        if tmpText != "" {
            // clear textFeild
            textField.text = ""
            
            // add textView
            textView.text += tmpText
            textView.text += "\n"
            
            // clear warningLabel
            warningLabel.text = ""
        } else {
            // show attention
            warningLabel.text = "文字を入力してください"
        }
    }
    
    // process of pushing a clearTextButton
    @IBAction func pushClearTextButton() {
        // clear textView
        textView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // clear textView on start-up
        textView.text = ""
        // background color
        textView.backgroundColor = .lightGray
        
        // clear warningLabel
        warningLabel.text = ""
        
        // change size of textViewn
//        let width = UIScreen.main.bounds.size.width
//        textView.frame.size = CGSize(width: width, height: 300)
    }
    
    // process of toching non-UI componet
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
