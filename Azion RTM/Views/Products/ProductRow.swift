import SwiftUI

struct ProductRow: View {
    var product: Product
    @State private var definitionAlert = false
    var body: some View {
        HStack {
            product.image
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(5)
                .background(product.active ? .orange : .gray)
                .cornerRadius(5)
            Text(product.name).padding()
            
            Spacer()
        }.opacity(product.active ? 1 : 0.3)
            
        
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: products[0])
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
