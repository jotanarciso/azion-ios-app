//
//  HomeView.swift
//  Azion RTM
//
//  Created by Joao Narciso on 13/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ProductList()
                .navigationTitle("Home")
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
