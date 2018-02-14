//
//  ChartViewController.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/11.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var rect = view.bounds
        rect.origin.y += 20
        rect.size.height -= 20
        let barChartView = BarChartView(frame: rect)
        let entry = [
            BarChartDataEntry(x: 10, y: 30),
            BarChartDataEntry(x: 20, y: 20),
            BarChartDataEntry(x: 30, y: 40),
            BarChartDataEntry(x: 40, y: 10),
            BarChartDataEntry(x: 50, y: 30)
        ]
        let set = [
            BarChartDataSet(values: entry, label: "Data")
        ]
        barChartView.data = BarChartData(dataSets: set)
        view.addSubview(barChartView)
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
