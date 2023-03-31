//
//  AzList.swift
//  Azion RTM
//
//  Created by Joao Narciso on 13/03/23.
//

import SwiftUI

struct ProductList: View {
    let dictionaryByCategory = Dictionary(grouping: products, by: { $0.category })
    @State private var notAvaliableAlert = false
    @State private var definitionAlert = false
    var body: some View {
        VStack(alignment: .leading){
            NavigationView {
                List {
                    ForEach(dictionaryByCategory.keys.sorted(), id: \.self) {category in
                        Section {
                            ForEach(dictionaryByCategory[category]! ) { product in
                                NavigationLink(destination: ProductContent(viewName: product.view)){
                                ProductRow(product: product)
                                }.disabled(!product.active)
                                   
                            }
                        } header: {
                            Text(category)
                        }
                    }}
            }
            
        }
            
        
    }
}

func productCategory(category: Array<Product>) {
    
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
