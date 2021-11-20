//
//  ContentView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 14/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        AppButton(title: "Primary", type: .primary) {
//            print("Say Primary")
//        }
       // AppLabel(title: "Hello SwiftUI!", style: .heading1)
        //ViewsList()
        NavigationView {
            ViewsList()
            .navigationTitle("Design System")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}
