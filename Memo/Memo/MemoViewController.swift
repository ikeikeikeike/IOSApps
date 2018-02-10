//
//  MemoViewController.swift
//  Memo
//
//  Created by Tatsuo Ikeda on 2018/02/10.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {

    var memo: String?
    
    @IBOutlet weak var memoField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBAction func memoFieldChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    @IBAction func cancel(_ sender: Any) {
        if presentingViewController is UINavigationController {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = memo {
            memoField.text = text
            navigationItem.title = "Edit Memo"
        }
        
        updateSaveButtonState()
    }
    
    private func updateSaveButtonState() {
        saveButton.isEnabled = !(memoField.text ?? "").isEmpty
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let btn = sender as? UIBarButtonItem, btn === saveButton else {
            return
        }
        
        memo = memoField.text ?? ""
    }
    
    
    
    
    
    
    
}
