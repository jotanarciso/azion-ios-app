//
//  RealTimePurge.swift
//  Azion RTM
//
//  Created by Joao Narciso on 14/03/23.
//

import SwiftUI

struct RealTimePurge: View {
    @EnvironmentObject var loadingState: LoadingState
    @State private var url = "www.example.com"
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        if(!loadingState.isLoading) {
            NavigationStack {
                TextEditor(text: $url)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    .padding()
                
                AzButton(title: "Purge",
                         backgroundColor: Color.orange,
                         foregroundColor: Color.white,
                         action: {
                    sendPostRequest()
                }
                )
                .navigationTitle("Real-Time Purge")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage))
            }
        }
        if(loadingState.isLoading){
            ProgressView()
        }
    }
    
    func sendPostRequest() {
        loadingState.isLoading = true
        let token = LocalStorage.myValue
        let urls = url.split(separator: "\n").map { String($0) }
        
        // Construct the payload for the POST request
        let payload = [
            "urls": urls,
            "method": "delete"
        ] as [String : Any] as [String : Any]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: payload)
        
        let url = URL(string: "https://api.azionapi.net/purge/url")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Token azion6b95011da3d3af51c53b0c6993884fb6959", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; version=3", forHTTPHeaderField: "Accept")
        
        request.httpBody = jsonData
        
        // Send the POST request using URLSession
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    self.loadingState.isLoading = false
                    self.showingAlert.toggle()
                    self.alertTitle = "Error"
                    self.alertMessage = "An error occurred while sending the purge request."
                }
            } else if let data = data {
                print("Response: \(String(data: data, encoding: .utf8) ?? "")")
                DispatchQueue.main.async {
                    self.loadingState.isLoading = false
                    self.showingAlert = true
                    self.alertTitle = "Success"
                    self.alertMessage = "The purge request was successful."
                    self.url = "example.com"
                }
            }
        }
        task.resume()
    }
}

struct RealTimePurge_Previews: PreviewProvider {
    static var previews: some View {
        RealTimePurge().environmentObject(LoadingState())
    }
}
