//
//  ContentView.swift
//  Counter
//
//  Created by Matt Thomas on 9/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var value: Double = 2.3

    var body: some View {
        VStack {
            Counter($value, format: .percent)
                .font(.system(.body, design: .monospaced))
            Button {
                withAnimation {
                    value = Double.random(in: -999.99...999.99)
                }
            } label: {
                Text("Change")
            }
            Slider(value: $value, in: -999.99...999.99)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
