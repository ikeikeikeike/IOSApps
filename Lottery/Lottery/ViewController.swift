//
//  ViewController.swift
//  Lottery
//
//  Created by Tatsuo Ikeda on 2018/02/08.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBAction func doLottery(_ sender: Any) {
        let result = ["小吉", "中吉", "大吉"]
        let random = arc4random_uniform(UInt32(result.count))
        self.myLabel.text = result[Int(random)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myLabel.layer.borderColor = UIColor.orange.cgColor
        myLabel.layer.borderWidth = 5
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = myLabel.bounds.width / 2
        //        myLabel.layer.cornerRadius = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

