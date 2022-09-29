//
//  StoreRow.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Kingfisher
import SwiftUI

struct StoreRow: View {
    
    let product: StoreProduct
    
    var body: some View {
        ZStack {
            KFImage(URL(string: product.asset))
                .placeholder { ProgressView() }
                .resizable()
                .scaledToFit()
            
            Color.black.opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.title)
                            .font(.title2)
                            .fontWeight(.black)
                        
                        if !product.desc.isEmpty { Text(product.desc) }
                        if !product.tag.isEmpty { Text(product.tag) }
                        
                        Text("Purchase limit: \(product.purchaseLimit)")
                            .fontWeight(.black)
                        
                        HStack {
                            Image(systemName: product.isAvailable ? "bag.fill.badge.plus" : "bag.fill.badge.minus")
                                .foregroundColor(product.isAvailable ? .green : .red)
                                .font(.headline)
                                .fontWeight(.black)
                            
                            Text("\(product.pricing.first?.quantity ?? 0) Apex coins")
                                .fontWeight(.black)
                                .foregroundColor(.yellow)
                        }
                        
                        Text("Expires: \(product.expireDateText)")
                            .fontWeight(.black)
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                .shadow(radius: 5).shadow(radius: 5).shadow(radius: 5).shadow(radius: 5)
                .padding()
            }
        }
    }
}

struct StoreRow_Previews: PreviewProvider {
    static var previews: some View {
        StoreRow(product: ApexService().storeMock.first!)
    }
}
