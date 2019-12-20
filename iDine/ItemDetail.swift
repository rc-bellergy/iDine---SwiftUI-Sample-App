//
//  ItemDetail.swift
//  iDine
//
//  Created by Michael on 16/12/2019.
//  Copyright © 2019 Design Quest Limited. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order:Order
    
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Phoro: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x:-5, y:-5)
            }
            Text(item.description)
                .padding()
            Spacer()
            Button("Order This") {
                self.order.add(item: self.item)
            }.font(.largeTitle)
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing:
            Image(systemName: "suit.heart"))
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
