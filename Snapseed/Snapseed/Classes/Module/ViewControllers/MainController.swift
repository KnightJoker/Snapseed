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
    
    private let kLooksViewHeight: NSInteger = 80
    
    private var _imagePickerController: UIImagePickerController?
    private var imagePickerController: UIImagePickerController? {
        get {
            if nil == _imagePickerController {
                _imagePickerController = UIImagePickerController()
                _imagePickerController?.allowsEditing = true
                _imagePickerController?.sourceType = .photoLibrary
                _imagePickerController?.delegate = self
            }
            return _imagePickerController
        }
        set {
           _imagePickerController = newValue
        }
    }
    
    private var _looksView: LooksView?
    private var looksView: LooksView {
        get {
            if nil == _looksView {
                _looksView = LooksView.init()
            }
            return _looksView!
        }
        set {
            _looksView = newValue
        }
    }
    
    
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
        
        self.setupLooksView(image)
        menuView.onLooksButtonDidClick = { [weak self] _ in
            self?.showLooksViewAnimation()
        }
        
        menuView.onToolsButtonDidClick = { _ in
            
        }
        
        menuView.onExportButtonDidClick = { _ in
            
        }
    }
    
    private func setupLooksView(_ image:UIImage) {
        self.view.insertSubview(self.looksView, belowSubview: self.menuView)
        self.looksView.showImageView(image)
        self.looksView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.menuView.snp_top)
            make.left.equalTo(0)
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(kLooksViewHeight)
        }
    }
    
    private func showLooksViewAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            self.looksView.snp.updateConstraints { (make) -> Void in
                make.top.equalTo(self.menuView.snp_top).offset(-self.kLooksViewHeight)
            }
            self.imageView.snp.updateConstraints { (make) -> Void in
                make.bottom.equalTo(self.looksView.snp_top).offset(-20)
            }
            self.view.layoutIfNeeded()
        }, completion: { _ in
            // Gestures
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
            self.imageView.addGestureRecognizer(tap)
            self.imageView.isUserInteractionEnabled = true
        })
        
    }
    
     // MARK: - Gesture recognizers
    @objc private func tapAction(gestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: {
            self.looksView.snp.updateConstraints { (make) -> Void in
                make.top.equalTo(self.menuView.snp_top)
            }
            self.imageView.snp.updateConstraints { (make) -> Void in
                  make.bottom.equalTo(self.looksView.snp_top)
            }
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.imageView.removeGestureRecognizer(gestureRecognizer)
        })
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
