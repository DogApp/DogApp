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
    
    var image: UIImage?
    
    
    var managedContext: NSManagedObjectContext!
    var doglists:Doglist?
    var count = 0

    @IBAction func createEntity(_ sender : UIButton){
        let atmp:NSString = dogAge.text! as NSString
        let wtmp:NSString = dogWeight.text! as NSString
        let age:Int = Int(atmp.intValue)
        let weight:Float = wtmp.floatValue
        
        //var fetchdogs:[NSManagedObject] = []
        
        if age>0 && age<50 && weight>0.0 && dogName.text != "" {
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
            let newDog = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
            newDog.setValue(dogName.text, forKeyPath: "name")
            newDog.setValue(age, forKeyPath: "age")
            newDog.setValue(weight, forKeyPath: "weight")
            newDog.setValue(UIImagePNGRepresentation(image!), forKeyPath: "picture")
            newDog.setValue(false, forKeyPath: "vac_1")
            newDog.setValue(false, forKeyPath: "vac_2")
            newDog.setValue(false, forKeyPath: "vac_3")
        
            dogList.append(Dog(
                age:age,
                weight:weight,
                name:dogName.text!,
                imageName:"",
                imageData:UIImagePNGRepresentation(image!)!,
                vac_1:false,
                vac_2:false,
                vac_3:false
            ))
    
            // 4
            do {
                try managedContext.save()
                //fetchdogs.append(newDog)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        
            let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as!   ViewController
            self.present(mainViewController, animated: true, completion: nil)
        }
        else {
            var msgerror:String = ""
            if dogName.text == "" {
                msgerror += "이름을 입력해주세요!"
            }
            else if age==0 || weight == 0 {
                msgerror += "나이, 체중에 숫자를 입력해주세요!"
            }
            else if age>50 {
                msgerror += "정상적인 수치를 입력해주세요!"
            }
            let alert = UIAlertController(title: "입력 오류!",
                                          message: msgerror,
                                          preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "확인",
                                         style: .default)
            alert.addAction(OKAction)
            present(alert, animated: true)
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
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
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

