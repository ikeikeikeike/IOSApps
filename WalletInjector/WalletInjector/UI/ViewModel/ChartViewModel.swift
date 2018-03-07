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
        var entries = [ChartDataEntry]()

        for (index, model) in tradeModels.enumerated() {
            guard let unix = model.unixtime else {
                continue
            }
            guard let price = model.price else {
                continue
            }
//            guard let _ = model.amount else { continue }

            print((index, price))
            if index == 100 {
                break
            }

            let chartData = ChartDataEntry(x: Double(index), y: price)
            entries.append(chartData)
        }

//        for i in 1...20 {
//            let unko = arc4random_uniform(UInt32(i))*2
//            print(unko)
//            let chartData = ChartDataEntry(x: Double(i), y: Double(unko))
//            entries.append(chartData)
//        }

        let gradientColors = [UIColor.blue.cgColor, UIColor.clear.cgColor] as CFArray
        let colorLocations:[CGFloat] = [1.0, 0.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                       colors: gradientColors,
                                       locations: colorLocations)

        let line = LineChartDataSet(values: entries, label: "TradeHistory")
        // e.colors = [NSUIColor.black]
        line.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0)
        line.drawFilledEnabled = true
        line.mode = .horizontalBezier

        let data = LineChartData()
        data.addDataSet(line)

        chartView.data = data
        chartView.chartDescription?.text = "TradeHistory!"
    }
}
