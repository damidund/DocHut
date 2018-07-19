//
//  ViewController.swift
//  DocHut
//
//  Created by Damidu Dasanayake on 5/8/18.
//  Copyright © 2018 Damidu Dasanayake. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePickerController : UIImagePickerController!
    
    @IBOutlet weak var imageView1: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        imageView1.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    //Options menu
    @IBAction func actionSheet(_ sender: Any) {
  
        let optionMenu = UIAlertController(title: nil, message: "Choose an option", preferredStyle: .actionSheet)
        
        let openGalleryAction = UIAlertAction(title: "Open Photo Gallery", style: .default, handler: {(alert: UIAlertAction!) in
            self.openGallery()
        })
        
        let captureAction = UIAlertAction(title: "Capture Photo", style: .default, handler: {(alert: UIAlertAction!) in
            self.capturePhoto()
        })
        
        let grayScaleAction = UIAlertAction(title: "Grayscale", style: .default, handler: {(alert: UIAlertAction!) in
            
            self.convertToGrayScale()
        })
        
        let blackAndWhiteAction = UIAlertAction(title: "Black and White", style: .default, handler: {(alert: UIAlertAction!) in
            self.convertToBlackAndWhite()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(alert: UIAlertAction!) in
            self.imageView1.image = nil
        })
        
        optionMenu.addAction(openGalleryAction)
        optionMenu.addAction(captureAction)
        optionMenu.addAction(grayScaleAction)
        optionMenu.addAction(blackAndWhiteAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    //Applying gray scale filters
    func settingUpToGrayScale(image: UIImage) -> UIImage
    {
        var result = imageView1.image
        let ciImage = CIImage(image: image)
        if ciImage != nil
        {
        let grayScaleImage = ciImage?.applyingFilter("CIColorControls", parameters: [kCIInputSaturationKey:0.0])
        result = UIImage(ciImage: grayScaleImage!)
        }
        return result!
    }
    
    //Converting to gray scale
    func convertToGrayScale() {
        // If no photo is available
        if imageView1.image == nil
        {
            let alert = UIAlertController(title: "Please choose a photo", message: "It's recommended you to choose a photo before continuing.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }
        else
        {
        imageView1.image = settingUpToGrayScale(image: imageView1.image!)
        }
        
    }
    
    func capturePhoto()
    {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true, completion: nil)
        }
    }

    func openGallery()
    {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            present(imagePickerController, animated: true, completion: nil)
        }
    }
    
      //Applying black and white filters
    func settingUpToBlackAndWhite(image: UIImage) -> UIImage
    {
        var result = imageView1.image
        let ciImage = CIImage(image: image)
        if ciImage != nil
        {
            let blackAndWhiteImage = ciImage?.applyingFilter("CIColorControls", parameters: [kCIInputSaturationKey:0.0, kCIInputContrastKey:4.0])
            result = UIImage(ciImage: blackAndWhiteImage!)
        }
        return result!
    }
    
    //Converting to black and white
    func convertToBlackAndWhite() {
        // If no photo is available
        if imageView1.image == nil
        {
            let alert = UIAlertController(title: "Please choose a photo", message: "It's recommended you to choose a photo before continuing.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }
        else
        {
            imageView1.image = settingUpToBlackAndWhite(image: imageView1.image!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override open var shouldAutorotate: Bool {
        return false
    }

}

