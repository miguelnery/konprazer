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

    @State var aQuantity: String = ""
    @State var aPrice: String = ""
    @State var bQuantity: String = ""
    @State var bPrice: String = ""
    @State var result: String = ""

    var hue: String {
        String(comp.cheaperItem.price)
    }

    var lol: String {
        String(comp.priceDifferenceTotal)
    }

    var body: some View {
        VStack {
            TextFields(aText: $aQuantity,
                       bText: $bQuantity)
            TextFields(aText: $aPrice,
                       bText: $bPrice)
            Button("Hue") {
                guard let aq = Double(self.aQuantity),
                    let ap = Double(self.aPrice),
                    let bq = Double(self.bQuantity),
                    let bp = Double(self.bPrice) else { print("wtf");return }
                print(aq)
                print(ap)
                print(bq)
                print(bp)
                let result = Comparison(Grocery(.kg(aq), price: ap),
                                        Grocery(.kg(bq), price: bp))
                self.result = String(result.cheaperItem.price)

            }
            Text(result)
        }
    }
}

struct TextFields: View {

    @Binding var aText: String
//    private let aTitle: String
    @Binding var bText: String
//    private let bTitle: String

//    init(aText: Binding<String>,
//         aTitle: String,
//         bText: Binding<String>,
//         bTitle: String) {
//        self.aText = $aText
//        self.aTitle = aTitle
//        self.bText = bText
//        self.bTitle = bTitle
//    }

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Spacer()
            TextField("um produto", text: $aText)
                .keyboardType(.numbersAndPunctuation)
                .background(Color.gray)
            Spacer()
            TextField("outro produto", text: $bText)
                .keyboardType(.numbersAndPunctuation)
                .background(Color.gray)
            Spacer()
        }
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
