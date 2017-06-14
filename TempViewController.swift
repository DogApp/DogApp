//
//  TempViewController.swift
//  TestCase
//
//  Created by 최광익 on 2017. 6. 14..
//  Copyright © 2017년 최광익. All rights reserved.
//

import UIKit

class TempViewController: UIViewController, photoViewControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = image{
            imageView.image = image
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendImageData(imageData: Data){
        image = UIImage(data: imageData)
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
