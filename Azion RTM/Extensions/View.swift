//
//  View.swift
//  Azion RTM
//
//  Created by Joao Narciso on 14/03/23.
//

import SwiftUI

extension View {
    func viewByName(_ name: String) -> some View {
        let viewType = NSClassFromString(Bundle.main.namespace + "." + name) as! any View.Type
        return viewType.init()
    }
}

extension Bundle {
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
