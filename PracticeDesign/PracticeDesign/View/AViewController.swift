//
//  AViewController.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/03/21.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }

    @IBAction func transferAA(_ sender: Any) {
        let url = URL(string: "compass://aa:something")!
        handleRoute(url, router: Routes.router)
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
