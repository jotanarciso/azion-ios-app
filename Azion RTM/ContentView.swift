//
//  ContentView.swift
//  Azion RTM
//
//  Created by Joao Narciso on 13/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    @EnvironmentObject var loadingState: LoadingState
    @EnvironmentObject var personalTokenState: PersonalTokenState
     
    var body: some View {
        VStack() {
            if(personalTokenState.token.isEmpty) {
                    AuthView()
                }
                else {
                    HomeView()
                }
        }
        .task {
            try? await Task.sleep(for: Duration.seconds(1))
            self.launchScreenState.dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenStateManager())
            .environmentObject(LoadingState())
            .environmentObject(PersonalTokenState())
    }
}
