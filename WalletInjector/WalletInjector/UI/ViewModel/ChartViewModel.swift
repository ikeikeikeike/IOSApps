//
//  ChartViewModel.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/28.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import Foundation
import Charts

public protocol ChartViewModel {
    func refresh(chartView: LineChartView)
}

class ChartViewModelImpl: ChartViewModel {

    fileprivate let tradeModels: [TradeModel]

    init(tradeModels: [TradeModel]) {
        self.tradeModels = tradeModels
    }

    func refresh(chartView: LineChartView) {
        // set data

        var lineChartEntry  = [ChartDataEntry]()
        for i in 1...20 {
            let chartData = ChartDataEntry(x: Double(i), y: Double(arc4random_uniform(UInt32(i))*2))
            lineChartEntry.append(chartData)
        }

        // Colors of the gradient
        let gradientColors = [UIColor.blue.cgColor, UIColor.clear.cgColor] as CFArray
        // Positioning of the gradient
        let colorLocations:[CGFloat] = [1.0, 0.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                       colors: gradientColors,
                                       locations: colorLocations)

        let line = LineChartDataSet(values: lineChartEntry, label: "test")
        // e.colors = [NSUIColor.black]
        line.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0)
        line.drawFilledEnabled = true
        line.mode = .horizontalBezier

        let data = LineChartData()
        data.addDataSet(line)

        chartView.data = data
        chartView.chartDescription?.text = "Hello!"
    }
}
