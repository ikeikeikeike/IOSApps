//
//  DPickerViewController.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/04/15.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit
import CoreActionSheetPicker

class DPickerViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func inputButton(_ sender: Any) {
        let spicker = ActionSheetStringPicker(title: "Date:", rows: ["Male", "Female", "None"], initialSelection: 1, doneBlock: {
            picker, index, value in
            
            self.result.text = value as? String ?? ""
            
            print("index = \(index)")
            print("value = \(String(describing: value))")
            print("picker = \(String(describing: picker))")
            
        }, cancel: { ActionStringCancelBlock in print("cancel") }, origin: self.view)
        
        spicker?.show()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
