//
//  ContentView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 14/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ViewsList()
            .navigationTitle("SwiftUI Cookbook")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}
