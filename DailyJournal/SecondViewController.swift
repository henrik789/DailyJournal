

import UIKit
import CloudKit

class SecondViewController: UIViewController {
    var notes = [CKRecord]()
    let dateFormatter = DateFormatter()
    var cloudManager = CloudManager()
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var charleftLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveButton(_ sender: Any) {
        
//        let noteDate = UserDefaults.standard.object(forKey: "lastNoteEntry") as! Date
        cloudManager.dailynoteText = textView.text
        cloudManager.saveToCloud()
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
}

