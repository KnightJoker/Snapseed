//
//  MenuView.swift
//  Snapseed
//
//  Created by Xuli Chen on 2019/7/25.
//  Copyright © 2019 Huni. All rights reserved.
//

import UIKit

class MenuView: UIView {

    @IBOutlet var menuContentView: UIView!
    
    @IBOutlet private weak var looksButton: UIButton!
    @IBOutlet private weak var toolsButton: UIButton!
    @IBOutlet private weak var exportButton: UIButton!
    
    var onLooksButtonDidClick: ((MenuView) -> Void)?
    var onToolsButtonDidClick: ((MenuView) -> Void)?
    var onExportButtonDidClick: ((MenuView) -> Void)?
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        
        // Load & setup xib
        
        Bundle.main.loadNibNamed("MenuView", owner: self, options: nil)
        
        self.addSubview(self.menuContentView)
        
        self.menuContentView.frame = self.bounds
        self.menuContentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MARK: - Actions
    @IBAction private func looksButtonTouchUpInside(_ sender: Any) {
        self.onLooksButtonDidClick?(self)
    }
    
    @IBAction private func toolsButtonTouchUpInside(_ sender: Any) {
        self.onToolsButtonDidClick?(self)
    }
    
    @IBAction private func exportButtonTouchUpInside(_ sender: Any) {
        self.onExportButtonDidClick?(self)
    }
    
    
    
}
