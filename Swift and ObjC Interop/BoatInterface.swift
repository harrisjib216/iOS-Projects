//
//  BoatInterface.swift
//  ObjSwe
//
//  Created by development on 12/21/24.
//

import Foundation
import SwiftUI

@objc
class BoatInterface: NSObject {
    @MainActor @objc func returnBoatUI(_ boatName: String) -> UIViewController {
        var boatView = BoatView()
        boatView.boatName = boatName
        return UIHostingController(rootView: boatView)
    }
}
