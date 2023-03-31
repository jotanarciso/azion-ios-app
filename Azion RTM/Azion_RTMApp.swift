import SwiftUI

@main
struct LaunchScreenTutorialApp: App {
    
    @StateObject var launchScreenState = LaunchScreenStateManager()
    @StateObject var loadingState = LoadingState()
    @StateObject var personalTokenState = PersonalTokenState()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }
            .environmentObject(launchScreenState)
            .environmentObject(loadingState)
            .environmentObject(personalTokenState)
        }
    }
}
