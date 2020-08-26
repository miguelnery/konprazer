//
//  ContentView.swift
//  Konprazer
//
//  Created by Miguel Nery on 24/08/20.
//  Copyright © 2020 Miguel Nery. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let comp = Comparison(Grocery(.kg(0.700), price: 22.4),
                          Grocery(.kg(1.4), price: 37.69))

    var hue: String {
        String(comp.cheaperItem.price)
    }

    var lol: String {
        String(comp.priceDifferenceTotal)
    }

    var body: some View {
        VStack {
            Text(hue)
            Text(lol)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
