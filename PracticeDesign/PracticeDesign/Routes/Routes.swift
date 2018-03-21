//
//  Routes.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/03/22.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//
import UIKit
import Compass

class Routes {
    static var router = Router()
    
    class func initialize() {
        setupRouter()
    }
    
    private class func setupRouter(){
        Navigator.scheme = "compass"
        Navigator.routes = [
            "aa:{title}",
            "ab:{title}",
        ]
        
        router.routes = [
            "aa:{title}": AARoute(),
            "ab:{title}": ABRoute(),
        ]
    }
}

struct AARoute: Routable {
    let vc = UIStoryboard(name: "AA", bundle: nil)
        .instantiateViewController(withIdentifier: "AAViewController")
    
    func navigate(to location: Location, from currentController: CurrentController) throws {
        guard let title = location.arguments["title"] else {
            return
        }
        
        vc.title = title
        
        currentController.navigationController?.pushViewController(vc, animated: true)
    }
}

struct ABRoute: Routable {
    let vc = UIStoryboard(name: "AB", bundle: nil)
        .instantiateViewController(withIdentifier: "ABViewController")
    
    func navigate(to location: Location, from currentController: CurrentController) throws {
        guard let username = location.arguments["title"] else {
            return
        }
        
        vc.title = username
        
        currentController.navigationController?.pushViewController(vc, animated: true)
    }
}

