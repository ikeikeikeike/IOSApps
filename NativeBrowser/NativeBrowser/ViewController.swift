//
//  ViewController.swift
//  NativeBrowser
//
//  Created by Tatsuo Ikeda on 2018/02/09.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var fowardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(_ sender: Any) {
    }
    
    @IBAction func goFoward(_ sender: Any) {
    }
    
    @IBAction func reload(_ sender: Any) {
    }
}

