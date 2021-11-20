//
//  ImagePreview.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 2/10/21.
//

import SwiftUI

struct ImagePreview : View {
    @Binding var image : String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(radius: 5)
    }
}
