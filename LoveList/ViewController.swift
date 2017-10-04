//
//  ViewController.swift
//  LoveList
//
//  Created by Stephen Martinez on 10/2/17.
//  Copyright © 2017 Stephen Martinez. All rights reserved.
//
//  Git Clone https://github.com/enuance/LoveList.git


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var loveTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LoveList.shared.sampleInfo.count
        //Enter Count of Entities here from Core Data
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

    //Method for Deleting a Lover from the List
    func removeLover(loverAt: IndexPath){
        let removeAlert = UIAlertController(
            title: "No Longer A Lover",
            message: "Remove Lover From List?",
            preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel",style: .default)
        let removeAction = UIAlertAction(title: "Delete", style: .default) {[unowned self] action in
            //Enter a way to remove a Lover and associated Entities from Core Data here
            LoveList.shared.sampleInfo.remove(at: loverAt.row)
            self.loveTable?.deleteRows(at: [loverAt], with: .left)
        }
        removeAlert.addAction(removeAction)
        removeAlert.addAction(cancelAction)
        present(removeAlert, animated: true)
    }
    
    //Method for Adding a Lover to the List
    @IBAction func addLover(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(
            title: "New Name",
            message: "Add A New Lover!",
            preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {[unowned self] action in
            guard let textFieldOne = alert.textFields?.first, let nameToSave = textFieldOne.text else {return}
            guard let textFieldTwo = alert.textFields?.last, let nickNameToSave = textFieldTwo.text else {return}
            //Enter a way to Add a Lover and Associate Entities to Core Data Here
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

    //Methods To Make for CoreData
    func getEntityCount() -> Int{
        return 0
    }
    
    func getLover(at: IndexPath)/*Return Entity*/{
        
    }
    
    func createLover(name: String, nickName: String){
        
    }
    
    func removeLover(at: IndexPath){
        
    }
    
    
}

//Notes.............................................................................

//Fetch Request
// let searchForPhotoFrames: NSFetchRequest<PhotoFrame> = PhotoFrame.fetchRequest()

//NSPredicate
// let searchCriteriaOne = NSPredicate(format: "albumLocation >= %@", location)
//NSPredicate
// let searchCriteriaTwo = NSPredicate(format: "myLocation.uniqueID = %@", albumID)

//CompoundPredicate
// let compoundCriteria = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [searchCriteriaOne, searchCriteriaTwo])

//Sort Descriptor
// let sortByLocation = NSSortDescriptor(key: "albumLocation", ascending: true)

//Executing The Fetch
// do{framesToUpdate = try Traveler.shared.backgroundContext.fetch(searchForPhotoFrames)}
// catch{DispatchQueue.main.async {completion(DatabaseError.general(dbDescription: error.localizedDescription))};return}

//Executing a Count method on the SQL Database side
// countOfFrames = try? Traveler.shared.backgroundContext.count(for: searchForPhotoFrames)

//Updating Locations in a Table or Collection
// var orderedFrames = framesToUpdate
// let frameToDelete = orderedFrames.removeFirst()
// for frame in orderedFrames{frame.albumLocation -= 1}
// Traveler.shared.backgroundContext.delete(frameToDelete)









