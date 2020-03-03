//
//  SecondVC.swift
//  Custom Navigation Demo
//
//  Created by iMac on 03/03/20.
//  Copyright © 2020 iMac. All rights reserved.
//

import UIKit

class SecondVC: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var viewHeader: UIView!
    @IBOutlet weak var widthImgProfile: NSLayoutConstraint!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    let viewCustom = UIView()
    var imagePicker = UIImagePickerController()
    
    var vTitle : String?
    var vSubTitle : String?
    var imgUserProfile = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.titleView = viewHeader

        widthImgProfile.constant = (imgProfile.image != nil) ? 35.0 : 0.0
       self.viewHeader.setNeedsLayout()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        SetHeader()
    }
    
    @IBAction func pressBtnTitle(_ sender: UIButton) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Title", message: "Enter a Title", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            self.lblTitle.text = textField!.text!
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func pressBtn_SubTitle(_ sender: UIButton) {
        
        //1. Create the alert controller.
              let alert = UIAlertController(title: "Sub Title", message: "Enter a Sub title", preferredStyle: .alert)
              
              //2. Add the text field. You can configure it however you need.
              alert.addTextField { (textField) in
                  textField.text = ""
              }
              
              // 3. Grab the value from the text field, and print it when the user clicks OK.
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                  let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
                  self.lblSubTitle.text = textField!.text!
              }))
              
              // 4. Present the alert.
              self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func pressBtnImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")

            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
               imgUserProfile = pickedImage
          }

        SetHeader()
        
        dismiss(animated: true, completion: nil)
    }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
   
    func SetHeader() {
        
        self.imgProfile.image = imgUserProfile
            
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.height/2
        
        self.viewHeader.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 200, height: 44)
        widthImgProfile.constant = 35.0
        self.viewHeader.setNeedsLayout()
        
    }
}
