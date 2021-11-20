//
//  CircularLoader.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 25/10/21.
//

import SwiftUI

struct ActivityIndicator: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                Group {
                    let scale: CGFloat = !self.isAnimating ? (1-(CGFloat(index)/5)) : 0.2+CGFloat(index)/5
                    Circle()
                        .frame(width: geometry.size.width/5, height: geometry.size.height / 5)
                        .scaleEffect(scale)
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                }.frame(width: geometry.size.width, height: geometry.size.height)
                .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                .animation(Animation
                            .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                            .repeatForever(autoreverses: false))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }
}
