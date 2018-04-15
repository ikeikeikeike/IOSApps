//
//  DTableViewController.swift
//  PracticeDesign
//
//  Created by Tatsuo Ikeda on 2018/03/22.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

class DViewController: UITableViewController {
    
    let cellID = "DTableViewCell"
    let pickerCellID = "PickerTableViewCell"
    
    enum Section: Int {
        case User = 0
        case Account
        
        static let count: Int = Account.rawValue + 1
        
        func rows() -> [String] {
            switch self {
            case .User:
                return ["baka", "unko"]
            case .Account:
                return ["chinko", "manko"]
            }
        }

        func title() -> String {
            switch self {
            case .User:
                return "user"
            case .Account:
                return "account"
            }
        }

        func rowsCount() -> Int {
            return rows().count
        }
        
        subscript(index: Int) -> String {
            return rows()[index]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .some(.User):
            return Section.User.rowsCount()
        case .some(.Account):
            return Section.Account.rowsCount()
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .some(.Account):
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            cell.textLabel?.text = Section(rawValue: indexPath.section)?[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            cell.textLabel?.text = Section(rawValue: indexPath.section)?[indexPath.row]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section(rawValue: section) {
        case .some(.User):
            return Section.User.title()
        case .some(.Account):
            return Section.Account.title()
        default:
            return "Section-\(section)"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch Section(rawValue: indexPath.section) {
        case .some(.User):
            let s = Section.User
            let url = URL(string: "compass://dupdater:\(s.title()):\(s[indexPath.row])")!
            handleRoute(url, router: Routes.router)

        case .some(.Account):
            let s = Section.Account
            let url = URL(string: "compass://dpicker:\(s.title()):\(s[indexPath.row])")!
            handleRoute(url, router: Routes.router)

        default:
            print("Default")
        }
    }
        
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
