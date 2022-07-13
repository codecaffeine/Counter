//
//  ContentView.swift
//  Counter
//
//  Created by Matt Thomas on 9/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var value: Double = 2.3

    private let range = 0.00...10.00

    var body: some View {
        VStack {
            Counter($value, format: .currency)
                .font(.system(.body, design: .monospaced))
            Button {
                withAnimation(.easeInOut(duration: 0.1)) {
                    value = Double.random(in: range)
                }
            } label: {
                Text("Change")
            }
            Slider(value: $value, in: range)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
