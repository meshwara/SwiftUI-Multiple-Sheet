//
//  ContentView.swift
//  TestMultiSheet
//
//  Created by D. Prameswara on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    enum ActiveSheet: Identifiable {
        case modal3, modal4

        var id: Int {
            hashValue
        }
    }

    @State private var mdl: ActiveSheet?
    @State private var mdl1: Bool = false
    @State private var mdl2: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button("Modal 1") {
                    mdl1 = true
                }
                
                Button("Modal 2") {
                    mdl2 = true
                }
            }
            Divider()
                .padding()
            HStack {
                Button("Modal 3") {
                    mdl = .modal3
                }
                Button("Modal 4") {
                    mdl = .modal4
                }                
            }
        }
        .padding()
        .sheet(isPresented: $mdl1) {
            Text("Modal 1")
        }
        .sheet(isPresented: $mdl2) {
            Text("Modal 2")
        }
        .sheet(item: $mdl, content: {item in
            switch item {
            case .modal3: Text("Modal 3")
            case .modal4: Text("Modal 4")
            }
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
