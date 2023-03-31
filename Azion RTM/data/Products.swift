import Foundation
import SwiftUI

struct Product: Hashable, Codable {
    var id: Int
    var name: String
    var state: String
    var description: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
