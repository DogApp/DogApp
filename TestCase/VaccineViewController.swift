//
//  VaccineViewController.swift
//  TestCase
//
//  Created by Jayron Cena on 14/06/2017.
//  Copyright © 2017 최광익. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class VaccineViewController: UITableViewController {
    var checked =   [   dogList[chosenDog].vac_1,
                        dogList[chosenDog].vac_2,
                        dogList[chosenDog].vac_3
                    ]
    
    @IBAction func done() {
        var fetchdogs:[NSManagedObject] = []
        
        dogList[chosenDog].vac_1 = checked[0]
        dogList[chosenDog].vac_2 = checked[1]
        dogList[chosenDog].vac_3 = checked[2]
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Doglist")
        
        do {
            fetchdogs = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        /*
        let entity =
            NSEntityDescription.entity(forEntityName: "Doglist",
                                       in: managedContext)!
        let newDog = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        newDog.setValue(dogList[chosenDog].name, forKeyPath: "name")
        newDog.setValue(dogList[chosenDog].age, forKeyPath: "age")
        newDog.setValue(dogList[chosenDog].weight, forKeyPath: "weight")
        newDog.setValue(dogList[chosenDog].imageData, forKeyPath: "picture")
        newDog.setValue(checked[0], forKeyPath: "vac_1")
        newDog.setValue(checked[1], forKeyPath: "vac_2")
        newDog.setValue(checked[2], forKeyPath: "vac_3")
        */
        
        let cDog = fetchdogs[chosenDog]
        cDog.setValue(checked[0], forKeyPath: "vac_1")
        cDog.setValue(checked[1], forKeyPath: "vac_2")
        cDog.setValue(checked[2], forKeyPath: "vac_3")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    var items: [ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        let row0item = ChecklistItem()
        row0item.text = "종합백신(DHPPL)"
        row0item.checked = dogList[chosenDog].vac_1
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "코로나 장염 백신"
        row1item.checked = dogList[chosenDog].vac_2
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "켄넬 코프 백신"
        row2item.checked = dogList[chosenDog].vac_3
        items.append(row2item)
        /*
        let row3item = ChecklistItem()
        row3item.text = "광견병백신 백신"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "구충제"
        row4item.checked = true
        items.append(row4item)
        
        let row5item = ChecklistItem()
        row5item.text = "심장사상충 예방"
        row5item.checked = true
        items.append(row5item)
        */
        super.init(coder: aDecoder)
        
        print("Documents folder is \(documentsDirectory())")
        
        print("Data file path is \(dataFilePath())")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView,
                            
                            numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(_ tableView: UITableView,
                            
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            
            withIdentifier: "ChecklistItem", for: indexPath)
        
        
        
        let item = items[indexPath.row]
        
        
        
        configureText(for: cell, with: item)
        
        configureCheckmark(for: cell, with: item)
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView,
                            
                            didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            
            item.toggleChecked()
            
            configureCheckmark(for: cell, with: item)
            
            checked[indexPath.row] = !(checked[indexPath.row])
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
     //   saveChecklistItems()
    }
    
    override func tableView(_ tableView: UITableView,
                            
                            commit editingStyle: UITableViewCellEditingStyle,
                            
                            forRowAt indexPath: IndexPath) {
        
        // 1
        
        items.remove(at: indexPath.row)
        
        
        
        // 2
        
        let indexPaths = [indexPath]
        
        tableView.deleteRows(at: indexPaths, with: .automatic)
       // saveChecklistItems()
        
    }
    
    
    func configureCheckmark(for cell: UITableViewCell,
                            
                            with item: ChecklistItem) {
        
        if item.checked {
            
            cell.accessoryType = .checkmark
            
        } else {
            
            cell.accessoryType = .none
            
        }
        
    }
    
    func configureText(for cell: UITableViewCell,
                       
                       with item: ChecklistItem) {
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func documentsDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory,
                                             
                                             in: .userDomainMask)
        
        return paths[0]
        
    }
    
    func dataFilePath() -> URL {
        
        return documentsDirectory().appendingPathComponent("Checklists.plist")
        
    }
    
    /*
    func saveChecklistItems() {
        
        let data = NSMutableData()
        
        let archiver = NSKeyedArchiver(forWritingWith: data)
        
        archiver.encode(items, forKey: "ChecklistItems")
        
        archiver.finishEncoding()
        
        data.write(to: dataFilePath(), atomically: true)
        
    }*/
    
    

}
