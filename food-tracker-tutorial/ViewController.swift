//
//  ViewController.swift
//  food-tracker-tutorial
//
//  Created by Drahman AbdulBasir on 1/10/16.
//  Copyright © 2016 or9. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        // MARK: UIImagePickerControllerDelegate
        func imagePickerControllerDidCancel(picker: UIImagePickerController) {
                // dismiss picker if user canceled
                dismissViewControllerAnimated(true, completion: nil)
        }
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
                // info dictionary contains multiple versions of image
                // this uses the original
                let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
                photoImageView.image = selectedImage
                dismissViewControllerAnimated(true, completion: nil)
        }
        
        // MARK: UITextFieldDelegate
        @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        // ensure hide keyboard
        nameTextField.resignFirstResponder()
        
        // allow users to pick from photo library
        let imagePickerController = UIImagePickerController()
        
        // only allow photos to be selected, not taken
        imagePickerController.sourceType = .PhotoLibrary
        
        // Ensure ViewController is notified by selection
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    // MARK: Actions
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
            mealNameLabel.text = "Oh Yeah!"
    }
    

}

