import SwiftUI
import WebKit


//
//  Created by German Fernandez on 16/02/2024.
//  Copyright © 2024 Max Lynch. All rights reserved.
//
struct WebView: UIViewRepresentable {
    let urlString: String
    //let delegate: WebViewDelegate?
    var onFinalResult: (() -> Void)?
    
    func makeUIView(context: Context) -> WKWebView {
        let webViewConfiguration = WKWebViewConfiguration()
        webViewConfiguration.allowsInlineMediaPlayback = true
 
        let webView = WKWebView(frame:.zero , configuration: webViewConfiguration);

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        uiView.navigationDelegate = context.coordinator
        uiView.uiDelegate = context.coordinator

        let jsScript : String = "window.addEventListener( 'onFinalResult', (e) => { window.webkit.messageHandlers.onFinalResult.postMessage(e.detail); });"
        let controller = uiView.configuration.userContentController
        controller.add(context.coordinator, name: "onFinalResult")
        controller.addUserScript(WKUserScript(source: jsScript,
                                              injectionTime: .atDocumentEnd,
                                                         forMainFrameOnly: true))
       
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url )
            uiView.load(request)
        }
    }



    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate , WKScriptMessageHandler {
        var parent: WebView
        var vw: WKWebView?

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.vw = webView;
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "onFinalResult" {
                parent.onFinalResult?();
                self.vw?.removeFromSuperview();
            }
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
            return
        }

    }
}
