//
//  SetTokenView.swift
//  Azion RTM
//
//  Created by Joao Narciso on 13/03/23.
//

import SwiftUI

struct AuthView: View {
    @State var isTokenSetted: Bool = false
    @State var value: String = ""
    var body: some View {
        return Group {
            if isTokenSetted {
                HomeView()
            }
            else {
                VStack {
                    Text("Authentication")
                        .font(.title)
                        .fontWeight(.bold)
                    SecureField(
                        "Set your personal Token",
                        text: $value
                    )
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    
                    AzButton(title: "Save",
                             backgroundColor: Color.white,
                             foregroundColor: Color.black,
                             action: {
                        LocalStorage.myValue = self.value
                        self.isTokenSetted = true
                        
                    }
                    )
                }
                .padding()
            }
            
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
