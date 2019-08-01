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
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var menuView: MenuView!
    
    private var imagePickerController: UIImagePickerController? {
        get {
            _imagePickerController = UIImagePickerController()
            _imagePickerController?.allowsEditing = true
            _imagePickerController?.sourceType = .photoLibrary
            _imagePickerController?.delegate = self
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
        self.setupView()
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
        
        imageView.isHidden = true
        menuView.isHidden = true
    }
    
    private func setupImageView(_ image:UIImage) {
        addImageView.isHidden = true
        tipLabel.isHidden = true
        imageView.isHidden = false
        menuView.isHidden = false
        imageView?.image = image
        
        menuView.onLooksButtonDidClick = { [weak self] _ in
            let looksView = LooksView.init(frame: CGRect(x: 0, y: kScreenHeight, width: kScreenWidth, height: 50))
            self?.view.addSubview(looksView)
            UIView.animate(withDuration: 0.3, animations: {
                looksView.frame = CGRect(x: 0, y: (self?.menuView.frame.minY)! - 50, width: kScreenWidth, height: 50)
            })
        }
        
        menuView.onToolsButtonDidClick = { _ in
            
        }
        
        menuView.onExportButtonDidClick = { _ in
            
        }
    }

}

extension MainController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.setupImageView(image)
            dismiss(animated: true, completion: nil)
        }
    }
    
}
