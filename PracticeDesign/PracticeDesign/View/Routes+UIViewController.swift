//
//  Route+UINavigationController.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/03/21.
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
            "aa:{username}",
            "ab:{title}",
        ]
        
        router.routes = [
            "aa:{username}": AARoute(),
            "ab:{title}": ABRoute(),
        ]
    }
}

struct AARoute: Routable {
    let vc = UIStoryboard(name: "AA", bundle: nil)
        .instantiateViewController(withIdentifier: "AAViewController")
    
    func navigate(to location: Location, from currentController: CurrentController) throws {
        guard let username = location.arguments["username"] else {
            return
        }
        
        vc.title = username
        
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

extension UIViewController {
    public func navigate(to route: String){
        (try? Navigator.navigate(urn: route)) ?? print("could not navigate to \(route)")
    }
    
    public func handleRoute(_ url: URL, router: Router)  {
        guard let location = Navigator.parse(url: url) else {
            print("Location not found")
            return
        }
        
        router.navigate(to: location, from: self)
    }

    public static var defaultNib: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    public static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}
