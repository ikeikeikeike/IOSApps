//
//  WalletAPI.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/16.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import Moya

enum WalletAPI {
    case signin(email: String, password: String)
    case signup(email: String, password: String)
    case index
}

// MARK: - TargetType Protocol Implementation
extension WalletAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:9009")!
    }

    var path: String {
        switch self {
        case .signin:
            return "/account/signin"
        case .signup:
            return "/account/signup"
        case .index:
            return "/account/index"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signin, .signup:
            return .post
        default:
            return .get
        }
    }

    var task: Task {
        var params = [String: Any]()
        switch self {
        case .signin(let email, let password):
            params = ["email": email, "password": password]
        case .signup(let email, let password):
            params = ["email": email, "password": password]
        default:
           break
        }

        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }

    var headers: [String : String]? {
        return nil
    }

    var sampleData: Data {
        let resource: String? = String(describing: self)
        let path = Bundle.main.path(forResource: resource, ofType: "json")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }

}

protocol WalletProvider {
    var api: MoyaProvider<WalletAPI> { get }
}

struct WalletProviderImpl: WalletProvider {
    var api: MoyaProvider<WalletAPI> = {
        let stubClosure = { (target: WalletAPI) -> StubBehavior in .never }
        let networkLoggerPlugin = NetworkLoggerPlugin(cURL: true)
        let plugins = [networkLoggerPlugin]

        return MoyaProvider<WalletAPI>(stubClosure: stubClosure, plugins: plugins)
    }()
}
