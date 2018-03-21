//
//  Routes+UINavigationController.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/03/21.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit
import Compass

struct ARoute: Routable {
    let vc = UIStoryboard(name: "A", bundle: nil).instantiateViewController(withIdentifier: "AViewController")
    
    func navigate(to location: Location, from currentController: CurrentController) throws {
        guard let username = location.arguments["username"] else {
            return
        }
        
        vc.title = username
        
//        currentController.pushOrPop(to:loginController)
    }
}

struct BRoute: Routable {
    let vc = UIStoryboard(name: "B", bundle: nil).instantiateViewController(withIdentifier: "BViewController")
    
    func navigate(to location: Location, from currentController: CurrentController) throws {
        guard let username = location.arguments["title"] else {
            return
        }
        
        vc.title = username
        
//        currentController.pushOrPop(to:rootviewcontroller)
    }
}

public class RouteNavigationController: UINavigationController {
    
    public func handleRoute(_ url: URL, router: Router)  {
        guard let location = Navigator.parse(url: url) else {
            print("Location not found")
            return
        }
        router.navigate(to: location, from: self)
    }
    
    public func navigate(to route: String){
        do {
            try Navigator.navigate(urn: route)
        } catch {
            print("could not navigate to \(route)")
        }
    }
    
    var router = Router()
    let rootviewcontroller = UIStoryboard(name: "CompassMain", bundle: nil).instantiateViewController(withIdentifier: "CompassRootViewController")
    let loginController = UIStoryboard(name: "CompassMain", bundle: nil).instantiateViewController(withIdentifier: "CompassLoginViewController")

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        Navigator.scheme = "compass"
        print( Navigator.scheme)
        
        Navigator.routes = [
            "login:{username}",
            "home:{title}",
        ]
        print( Navigator.routes)
        
        router.routes = [
            "login:{username}": LoginRoute(),
            "home:{title}": HomeRoute(),
        ]
        print( Navigator.routes)
        print(router.routes)
        
        let url = URL(string: "compass://login:George_logged_in")!
        self.handleRoute(url, router: router)
    }
    
    override public func didReceiveMemoryWarning() {
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
