import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    // var to store the textField's text
    var tmpText: String = ""
    
    // process of pushing a button
    @IBAction func pushButton() {
        // get textFeild's text
        tmpText = textField.text!
        // clear textFeild
        textField.text = ""
        
        // add textView
        textView.text += tmpText
        textView.text += "\n"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // clear textView on start-up
        textView.text = ""
        // background color
        textView.backgroundColor = .lightGray
    }
    
    // process of toching non-UI componet
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
