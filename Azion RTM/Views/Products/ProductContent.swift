//
//  ProductContent.swift
//  Azion RTM
//
//  Created by Joao Narciso on 14/03/23.
//

import SwiftUI
struct ProductContent: View {
    var viewName: String
    var body: some View {
        Group {
            switch viewName {
            case "realtimepurge":
                RealTimePurge()
            default:
                EmptyView()
            }
        }
    }
}

struct ProductContent_Previews: PreviewProvider {
    static var previews: some View {
        ProductContent(viewName: products[0].view)
    }
}
