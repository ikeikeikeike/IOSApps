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

    let name: String = "CoincheckJPY"

    var chartView: LineChartView!
    @IBOutlet weak var chartArea: UIView!

    var presenter: ChartPresenter! {
        didSet { presenter.view = self }
    }

    var chartVM: ChartViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setupUI()
        presenter.refreshData(name: name)
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

extension ChartViewController: ChartPresenterView, ChartViewDelegate {

    func reloadView(chartVM: ChartViewModel) {
        chartVM.refresh(chartView: chartView)
        self.chartVM = chartVM
    }

    func setupChartView() {
        chartView = LineChartView()
        chartView.delegate = self
//        chartView.frame = chartArea.frame

//        chartArea.addSubview(chartView)
    }
}
