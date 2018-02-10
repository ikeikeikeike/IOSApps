//
//  MemoTableViewController.swift
//  Memo
//
//  Created by Tatsuo Ikeda on 2018/02/10.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

class MemoTableViewController: UITableViewController {

    let storage = UserDefaults.standard
    var memos = [String]()
    
    @IBAction func unwindToMemoList(sender: UIStoryboardSegue) {
        guard let vc = sender.source as? MemoViewController, let memo = vc.memo else {
            return
        }
        
        if let idx = tableView.indexPathForSelectedRow {
            memos[idx.row] = memo
        } else {
            memos.append(memo)
        }
        
        tableView.reloadData()
        storage.set(memos, forKey: "memos")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if storage.object(forKey: "memos") != nil {
            memos = storage.stringArray(forKey: "memos")!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.memos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoTableViewCell", for: indexPath)

        cell.textLabel?.text = memos[indexPath.row]

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "section-\(section)"
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memos.remove(at: indexPath.row)
            storage.set(memos, forKey: "memos")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        /*
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        */
    }


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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier else { return }
        if id == "editMemo" {
            let memoVC = segue.destination as! MemoViewController
            memoVC.memo = memos[(tableView.indexPathForSelectedRow?.row)!]
        }
        
        
        
    }

}
