//
//  ViewController.swift
//  TestCase
//
//  Created by 최광익 on 2017. 5. 23..
//  Copyright © 2017년 최광익. All rights reserved.
//

import UIKit

class circleImageView:UIImageView{
    var imgIndex:Int = -1
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let radius   = self.frame.size.width / 2
        let distance = sqrt(pow(point.x - self.frame.size.width  / 2, 2) +
            pow(point.y - self.frame.size.height / 2, 2))
        
        return distance < radius ? super.hitTest(point, with: event) : nil
    }
}

class ViewController: UIViewController {
    //var image: circleImageView? = nil
    //var image2: circleImageView? = nil
    //var image3: circleImageView? = nil

    @IBOutlet var image3: circleImageView!
    @IBOutlet weak var image: circleImageView!
    @IBOutlet var image2: circleImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchFunc))
        gestureRecognizer.cancelsTouchesInView = false
        
        let gestureRecognizerLtR = UISwipeGestureRecognizer(target: self, action: #selector(swipeFuncLtR))
        gestureRecognizerLtR.cancelsTouchesInView = false
        
        let gestureRecognizerRtL = UISwipeGestureRecognizer(target: self, action: #selector(swipeFuncRtL))
        gestureRecognizerRtL.cancelsTouchesInView = false
        gestureRecognizerRtL.direction = .left
        
        var imageMade:UIImage?
        
        image3.layer.borderWidth = 1
        image3.layer.masksToBounds = false
        image3.layer.borderColor = UIColor.black.cgColor
        image3.layer.cornerRadius = image3.frame.height/2
        image3.clipsToBounds = true
        image3.imgIndex = 2
        if (dogList.count >= 3){
            imageMade = UIImage(data: dogList[2].imageData)
            image3.image = imageMade
            
            //image3.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
            //image3.frame.origin.x = view.frame.width/2 + 35
            //image3.frame.origin.y = view.frame.height/2 - 200
        }
        else{
            image3.removeFromSuperview()
        }
        
        image2.layer.borderWidth = 1
        image2.layer.masksToBounds = false
        image2.layer.borderColor = UIColor.black.cgColor
        image2.layer.cornerRadius = image2.frame.height/2
        image2.clipsToBounds = true
        image2.imgIndex = 0
        if (dogList.count >= 2){
            imageMade = UIImage(data: dogList[0].imageData)
            image2.image = imageMade
            
            //image2.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
            //image2.frame.origin.x = view.frame.width/2 - 185
            //image2.frame.origin.y = view.frame.height/2 - 200
        }
        else{
            image2.removeFromSuperview()
        }
        
        if (dogList.count >= 1){
            if (dogList.count == 1){
                imageMade = UIImage(data: dogList[0].imageData)
                chosenDog = 0
            }
            else{
                imageMade = UIImage(data: dogList[1].imageData)
                chosenDog = 1
            }
            image.image = imageMade
        
            //image.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
            //image.frame.origin.x = view.frame.width/2 - 75
            //image.frame.origin.y = view.frame.height/2 - 180
            image.layer.borderWidth = 1
            image.layer.masksToBounds = false
            image.layer.borderColor = UIColor.black.cgColor
            image.layer.cornerRadius = image.frame.height/2
            image.clipsToBounds = true
            image.addGestureRecognizer(gestureRecognizer)
            image.addGestureRecognizer(gestureRecognizerLtR)
            image.addGestureRecognizer(gestureRecognizerRtL)
            image.isUserInteractionEnabled = true
            image.imgIndex = chosenDog
            view.bringSubview(toFront: image)
        }
    }
    
    func touchFunc(){
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //self.navigationController?.pushViewController(secondViewController, animated: true)
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func swipeFuncLtR(){
        if (dogList.count != 1){
            if (image.imgIndex == 0){
                print("No more.")
            }
            else{
                image.imgIndex -= 1
                image2.imgIndex -= 1
                image3.imgIndex -= 1
            
                image3.image = image.image
                image.image = image2.image
                if (image2.imgIndex < 0){
                    image2.removeFromSuperview()
                }
                else{
                    let imageMade = UIImage(data: dogList[image2.imgIndex].imageData)
                    image2.image = imageMade
                }
            
                if (image3.imgIndex == dogList.count-1){
                    view.addSubview(image3)
                    view.bringSubview(toFront: image)
                }
            
                chosenDog -= 1
            }
        }
    }
    
    func swipeFuncRtL(){
        if (dogList.count != 1){
            if (image.imgIndex == dogList.count - 1){
                print("No more.")
            }
            else{
                image.imgIndex += 1
                image2.imgIndex += 1
                image3.imgIndex += 1
            
                image2.image = image.image
                image.image = image3.image
                if (image3.imgIndex == dogList.count){
                    image3.removeFromSuperview()
                }
                else{
                    let imageMade = UIImage(data: dogList[image3.imgIndex].imageData)
                    image3.image = imageMade
                }
            
                if (image2.imgIndex == 0){
                    view.addSubview(image2)
                    view.bringSubview(toFront: image)
                }
            
                chosenDog += 1
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

