//
//  FaceVerifyView.swift
//  Plugin
//
//  Created by German Fernandez on 16/02/2024.
//  Copyright © 2024 Max Lynch. All rights reserved.
//

import Foundation
import SwiftUI


struct FaceVerifyView: View {
    
    var url: String
    var onFinalResult: (() -> Void)?
      
    init(url: String, onFinalResult: (() -> Void)?) {
        self.url = url
        self.onFinalResult = onFinalResult
  }
    
    @State private var isPresentWebView = true


    var body: some View {
        WebView(urlString: self.url, onFinalResult: self.onFinalResult)
    }
}
