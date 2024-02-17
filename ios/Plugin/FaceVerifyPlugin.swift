import Foundation
import Capacitor

//
//  Created by German Fernandez on 16/02/2024.
//  Copyright © 2024 Max Lynch. All rights reserved.
//
@objc(FaceVerifyPlugin)
public class FaceVerifyPlugin: CAPPlugin {

    @objc func showVerify(_ call: CAPPluginCall) {
        let url = call.getString("url") ?? ""

        let viewController = FaceVerifyViewController()
        viewController.url = url;
        viewController.onClosed = { (withResult: Bool) in
            call.resolve([
                 "result": withResult
             ])
        }
        
        DispatchQueue.main.async {
            self.bridge?.viewController?.present(viewController, animated: true, completion: nil)
        }
    }
    
    @objc func viewClosed(){
      
    }
}
