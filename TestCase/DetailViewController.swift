//
//  DetailViewController.swift
//  TestCase
//
//  Created by 최광익 on 2017. 5. 25..
//  Copyright © 2017년 최광익. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var screenView: UIView!
    @IBOutlet weak var dogInfoLabel: UILabel!
    
    @IBOutlet weak var firstImage: UIImageView!
    
    var warnFirstFlag = true
    lazy var warnText = UITextView()
    
    var feedFirstFlag = true
    lazy var feedText = UITextField()
    
    var checkFirstFlag = true
    lazy var checkList = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imageName = dogList[chosenDog].imageName
        let imageMade = UIImage(named: imageName)
        firstImage.image = imageMade
        
        dogInfoLabel.text = dogList[chosenDog].name + " / " + String(dogList[chosenDog].age) + "살 / " + String(dogList[chosenDog].weight) + "kg"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func feedButtonPushed() {
        if feedFirstFlag == true{
            feedFirstFlag = false
            feedText.text = "\(dogList[chosenDog].name)에게 맞는 사료량은 \(calculateFeed(weight: dogList[chosenDog].weight))kg 입니다."
            feedText.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
            feedText.frame.origin.x = screenView.frame.origin.x-300
            feedText.frame.origin.y = screenView.frame.height/2
        }
        for subView in screenView.subviews{
            subView.removeFromSuperview()
        }
        screenView.addSubview(feedText)
    }
    
    @IBAction func warnButtonPushed() {
        if warnFirstFlag == true{
            warnFirstFlag = false
            warnText.text = "\(dogList[chosenDog].name)에게 맞는 사육법을 준비중입니다."
            warnText.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
            warnText.frame.origin.x = screenView.frame.origin.x-300
            warnText.frame.origin.y = screenView.frame.height/2
        }
        for subView in screenView.subviews{
            subView.removeFromSuperview()
        }
        screenView.addSubview(warnText)
    }
    
    @IBAction func vaccineButtonPushed() {
        if checkFirstFlag == true{
            checkList.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            checkList.frame.origin.x = screenView.frame.origin.x-250
            checkList.frame.origin.y = screenView.frame.origin.y-250
            
            let cell = checkList.dequeueReusableCell(withIdentifier: "Cell1")
            cell?.textLabel?.text = "Cell 1"
            checkList.reloadData()
            checkList.resignFirstResponder()
        }
        for subView in screenView.subviews{
            subView.removeFromSuperview()
        }
        screenView.addSubview(checkList)
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
