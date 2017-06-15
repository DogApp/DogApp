//
//  PhotoViewController.swift
//  PhotoPicker
//
//  Created by 고승원 on 2017. 5. 25..
//  Copyright © 2017년 고승원. All rights reserved.
//
//

import UIKit

protocol photoViewControllerDelegate: class{
    func sendImageData(imageData: Data)
}

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var image : UIImage?

    weak var delegate : photoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBAction func myButton() {
        let alert = UIAlertController(title: "새로운 사진 추가" ,message: "사진 추가 방법을 선택해주세요.", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "카메라", style: .default, handler: {action in self.takePhotoWithCamera()} )
        let action2 = UIAlertAction(title: "갤러리", style: .default, handler: {action in self.takePhotoFromLibrary()} )
        let action3 = UIAlertAction(title: "취소", style: .default, handler: nil )
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        present(alert, animated: true, completion: nil)
        
    }
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {print("no camera"); return}
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker,animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        image = info[UIImagePickerControllerEditedImage] as? UIImage
        if let theImage = image{
            show(image: theImage)
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func takePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker,animated: true, completion: nil)
    }
    
    
    func show(image: UIImage){
        myImage.image = image
        //myImage.isHidden = false
        //myImage.frame = CGRect(x : 10, y : 10, width: 260, height : 260)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendImage"{
            self.delegate = segue.destination as! NewViewController
            
            if let image = image{
                if let pngImage = UIImagePNGRepresentation(image){
                    delegate?.sendImageData(imageData: pngImage)
                }
            }
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
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
