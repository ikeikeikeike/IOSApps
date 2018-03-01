//
//  TradeStore.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/02/18.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import Moya

enum TradeAPI: String {
    case coincheckJPY = "CoincheckJPY"
    case bitflyerJPY  = "BitflyerJPY"
    case zaifJPY      = "ZaifJPY"
}

// MARK: - TargetType Protocol Implementation
extension TradeAPI: TargetType {
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
        let path = Bundle.main.path(forResource: symbol(), ofType: "csv")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }

    var task: Task {
        return .requestParameters(parameters: ["symbol": symbol()], encoding: URLEncoding.default)
    }

    var headers: [String : String]? {
        return nil
    }

    func symbol() -> String {
        switch self {
//        case .zaifJPY:
//            return "zaifJPY"
        default:
            return rawValue.firstLowercase()
        }
    }
}
