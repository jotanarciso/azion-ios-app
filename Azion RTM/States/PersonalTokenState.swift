//
//  PersonalTokenState.swift
//  Azion RTM
//
//  Created by Joao Narciso on 15/03/23.
//

import SwiftUI
import Combine

class PersonalTokenState: ObservableObject {
    @Published var token : String = ""
}
