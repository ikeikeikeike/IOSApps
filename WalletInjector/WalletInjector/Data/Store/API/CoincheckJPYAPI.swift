//
//  CoincheckJPYStore.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Moya

enum CoincheckJPYAPI {
    case trade
}

// MARK: - TargetType Protocol Implementation
extension CoincheckJPYAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.bitcoincharts.com/v1")!
    }

    var path: String {
        return "trades.csv"
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        let path = Bundle.main.path(forResource: "coincheckJPY", ofType: "csv")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }

    var task: Task {
        return .requestParameters(parameters: ["symbol": "coincheckJPY"], encoding: URLEncoding.default)
    }

    var headers: [String : String]? {
        return nil
    }
}
