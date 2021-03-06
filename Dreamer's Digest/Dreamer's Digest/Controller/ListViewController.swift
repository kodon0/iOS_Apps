//
//  ViewController.swift
//  Dreamer's Digest
//
//  Created by Kieran O'Donnell on 19/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UITableViewController{
    
    
    var dreamArray = [DreamCategory]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        // Do any additional setup after loading the view.
    }

    
    //MARK: - Table Datasource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dreamArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DreamTitleCell", for: indexPath)
        let title = dreamArray[indexPath.row]
        cell.textLabel?.text = title.name
        return cell
    }
    
    //MARK: - Define TableView Delegate Methods
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToContent", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ContentViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedDream = dreamArray[indexPath.row]
            //.content as! DreamContent
        }
    }
    
    //MARK: - Define Data Manipulation Methods
    
     func saveItems() {
         
         do {
             try context.save()
         } catch {
             print("Error saving Context: \(error)")
         }
         self.tableView.reloadData()
     }
     
     func loadItems(with request: NSFetchRequest<DreamCategory> = DreamCategory.fetchRequest()) {
         do {
             dreamArray = try context.fetch(request)
         } catch {
             print("Error fetching data from context: \(error)")
         }
    }
    
    //MARK: - Add new categories
    
    @IBAction func composeButtonPressed(_ sender: UIBarButtonItem) {
            
            var textField = UITextField()
            let alert = UIAlertController(title: "Insert a new Todooshy item?", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Add new item", style: .default) { (action) in
                // What heppens when user clicks Add Item button
                print("Action success!")
                
                // Append new item to array with new addition for CoreData -> gets context
                
                let newDream = DreamCategory(context: self.context)
                newDream.name = textField.text!
//                newDream.content = self.content
                self.dreamArray.append(newDream)
                
    //            Save items from defined method
                self.saveItems()
            
            }
            alert.addAction(action)
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "Start typing away!"
                textField = alertTextField
            }
            
            present(alert, animated: true, completion: nil)
        }
}


