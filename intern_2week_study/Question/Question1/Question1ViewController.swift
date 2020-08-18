import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var warningLabel: UILabel!
    
    // process of pushing a addButton
    @IBAction func pushAddButton() {
        guard !textField.text!.isEmpty else {
            warningLabel.text = "文字を入力してください"
            return
        }
        
        // add textView
        textView.text += textField.text!
        textView.text += "\n"
        
        // clear warningLabel
        warningLabel.text = ""
        
        //clear textFeild
        textField.text = ""
        
    }
    
    // process of pushing a clearTextButton
    @IBAction func pushClearTextButton() {
        // clear textView
        textView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // clear textView and warninLabel on start-up
        textView.text = ""
        warningLabel.text = ""
    }
    
    // process of toching non-UI componet
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
   }
}
