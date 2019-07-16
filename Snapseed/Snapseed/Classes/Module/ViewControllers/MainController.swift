//
//  ViewController.swift
//  Snapseed
//
//  Created by Xuli Chen on 2019/7/11.
//  Copyright © 2019 Huni. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var addImageView: UIImageView!
    
    private var imagePickerController: UIImagePickerController? {
        get {
            _imagePickerController = UIImagePickerController()
            _imagePickerController?.allowsEditing = true
            _imagePickerController?.sourceType = .photoLibrary
            _imagePickerController?.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            return _imagePickerController
        }
        set {
           _imagePickerController = newValue
        }
    }
    private var _imagePickerController: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    
    // MARK: private API
    @IBAction func onTapOpenButton(_ sender: Any) {
        self.present(self.imagePickerController!, animated: true, completion: nil)
    }
    
    // MARK: Setup View
    private func setupView() {
    
        moreButton.setImage(UIImage(named: "ic_more_white")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        moreButton.tintColor = kThemeBlackColor
        
        addImageView.image = (UIImage(named: "ic_add_green")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        addImageView.tintColor = kThemeBlackColor
        
    }

}

extension MainController : UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
    
}
