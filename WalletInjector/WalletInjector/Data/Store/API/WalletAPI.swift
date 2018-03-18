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
extension WalletAPI: TargetType, AccessTokenAuthorizable {

    var baseURL: URL {
        return URL(string: "http://localhost:9000")!
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

    var authorizationType: AuthorizationType {
        switch self {
        case .signup, .signin:
            return .none
        default:
            return .bearer
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

        return .requestParameters(parameters: params, encoding: JSONEncoding.default)
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
        let key = TokenKeyImpl()  // MARK -- Unuse DI
        let token: () -> String = { key.get() ?? "" }

        let auth   = AccessTokenPlugin(tokenClosure: token())
        let logger = NetworkLoggerPlugin(cURL: true)

        let stub = { (target: WalletAPI) -> StubBehavior in .never }
        return MoyaProvider<WalletAPI>(stubClosure: stub, plugins: [logger, auth])
    }()
}
