//
//  FavoritesView.swift
//  iDine
//
//  Created by Michael on 20/12/2019.
//  Copyright © 2019 Design Quest Limited. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorite: Favorite
    
    func deleteItems(at offsets: IndexSet) {
        favorite.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(favorite.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
            }
            .navigationBarTitle("Favorites")
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let favorite = Order()
    static var previews: some View {
        FavoritesView().environmentObject(favorite)
    }
}
