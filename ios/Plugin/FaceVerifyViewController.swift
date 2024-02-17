//
//  FaceVerifyViewController.swift
//  Plugin
//
//  Created by German Fernandez on 16/02/2024.
//  Copyright © 2024 Max Lynch. All rights reserved.
//

import Foundation
import SwiftUI

class FaceVerifyViewController: UIViewController {
    var url: String = ""
    private var withResult: Bool = false
    var onClosed: ((Bool) -> Void)? = nil
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        onClosed?(withResult);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = FaceVerifyView(url: self.url, onFinalResult: self.onFinalResult)
        let hostingController = UIHostingController(rootView: webView)

        view.backgroundColor = UIColor.white
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
                    hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])

    }
    
    // Método que se llama cuando se presiona el botón
    @objc func onFinalResult() {
        self.withResult = true;
        self.dismiss(animated: true)
    }


}
