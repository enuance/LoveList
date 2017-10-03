//
//  ViewController.swift
//  LoveList
//
//  Created by Stephen Martinez on 10/2/17.
//  Copyright © 2017 Stephen Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var loveTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LoveList.shared.sampleInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let loveCell = tableView.dequeueReusableCell(withIdentifier: LoveListConstant.loveCellRID, for: indexPath)
        loveCell.textLabel?.text = LoveList.shared.sampleInfo[indexPath.row].name
        loveCell.detailTextLabel?.text = LoveList.shared.sampleInfo[indexPath.row].nickName
        return loveCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        removeLover(loverAt: indexPath)
    }

    func removeLover(loverAt: IndexPath){
        let removeAlert = UIAlertController(
            title: "No Longer A Lover",
            message: "Remove Lover From List?",
            preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel",style: .default)
        let removeAction = UIAlertAction(title: "Delete", style: .default) {[unowned self] action in
            LoveList.shared.sampleInfo.remove(at: loverAt.row)
            self.loveTable?.deleteRows(at: [loverAt], with: .left)
        }
        removeAlert.addAction(removeAction)
        removeAlert.addAction(cancelAction)
        present(removeAlert, animated: true)
    }
    
    @IBAction func addLover(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(
            title: "New Name",
            message: "Add A New Lover!",
            preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {[unowned self] action in
            guard let textFieldOne = alert.textFields?.first, let nameToSave = textFieldOne.text else {return}
            guard let textFieldTwo = alert.textFields?.last, let nickNameToSave = textFieldTwo.text else {return}
            LoveList.shared.sampleInfo.append((nameToSave, nickNameToSave))
            self.loveTable?.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",style: .default)
        alert.addTextField()
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}

