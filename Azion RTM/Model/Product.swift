import Foundation
import SwiftUI

struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var category: String
    var active: Bool
    var view: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
