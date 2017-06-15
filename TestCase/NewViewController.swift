//
//  ViewController.swift
//  DataModel
//
//  Created by Gun young Won on 2017. 6. 1..
//  Copyright © 2017년 Gun young Won. All rights reserved.
//

import UIKit
import CoreData


class NewViewController: UIViewController, photoViewControllerDelegate {
    
    @IBOutlet weak var dogName: UITextField!
    @IBOutlet weak var dogAge: UITextField!
    @IBOutlet weak var dogWeight: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?
    
    
    var managedContext: NSManagedObjectContext!
    var doglists:Doglist?
    var count = 0

    @IBAction func createEntity(_ sender : UIButton){
        let atmp:NSString = dogAge.text! as NSString
        let wtmp:NSString = dogWeight.text! as NSString
        let age:Int = Int(atmp.intValue)
        let weight:Float = wtmp.floatValue
        var fetchdogs:[NSManagedObject] = []
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Doglist",
                                       in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        person.setValue(dogName.text, forKeyPath: "name")
        person.setValue(age, forKeyPath: "age")
        person.setValue(weight, forKeyPath: "weight")
        person.setValue(false, forKeyPath: "vac_1")
        person.setValue(false, forKeyPath: "vac_2")
        person.setValue(false, forKeyPath: "vac_3")
        // 4
        do {
            try managedContext.save()
            fetchdogs.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
/*        let dogFetch:NSFetchRequest<Doglist> = Doglist.fetchRequest()
        dogFetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Doglist.dogName), dogName)
        
        do {
            let results = try managedContext?.fetch(dogFetch)
            if results != nil {
                // Fido found, use Fido
                doglists = results?.first
            } else {
                // Fido not found, create Fido
                doglists? = Doglist(context: managedContext)
                doglists?.setval(Name: dogName.text!, Age: age, Weight: weight)
                try managedContext?.save()
            }
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }*/
        
    }
    @IBOutlet weak var dogmember: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        // Do any additional setup after loading the view, typically from a nib.
        
/*        let dogName = "Hi"
        let dogFetch:NSFetchRequest<Doglist> = Doglist.fetchRequest()
        dogFetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Doglist.dogName), dogName)
        
        do {
            let results = try managedContext?.fetch(dogFetch)
            if results != nil {
                // Fido found, use Fido
                doglists = results?.first
            } else {
                // Fido not found, create Fido
                doglists = Doglist(context: managedContext)
                doglists?.dogName = dogName
                doglists?.dogAge = 1
                doglists?.dogWeight = 2.0
                try managedContext.save()
            }
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sendImageData(imageData: Data){
        image = UIImage(data: imageData)
    }
}

/*class Doglist {
    var dogName: String = ""
    var dogAge: Int=0
    var dogWeight: Float=0.0
    
    init(Name:String, Age:Int, Weight:Float){
        self.dogName = Name
        self.dogAge = Age
        self.dogWeight = Weight
    }
}*/

