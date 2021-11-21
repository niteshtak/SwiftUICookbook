//
//  TextShimmer.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 20/11/21.
//

import SwiftUI

struct TextShimmer: View {
    
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack {
                AppLabel(title: "SwiftUI",  style: .heading1)
                    .foregroundColor(Color.white.opacity(0.5))
                    .font(.system(size: 36))
                
                AppLabel(title: "SwiftUI",  style: .heading1)
                    .foregroundColor(Color.white)
                    .font(.system(size: 36))
                    .mask(
                        Capsule()
                            .fill(LinearGradient(
                                    gradient: .init(colors: [.clear, .white, .clear]), startPoint: .top, endPoint: .bottom
                            ))
                            .rotationEffect(.init(degrees: 30))
                            .offset(x: self.show ? 180 : -130)
                    )
            }
        }
        .onAppear {
            withAnimation(Animation.default.speed(0.15).delay(0)
                .repeatForever(autoreverses: false)) {
                    self.show.toggle()
                }
        }
    }
}

struct CardShimmer: View {
    
    @State var show: Bool = false
    var center = (UIScreen.main.bounds.width/2) + 110
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.1)
            .frame(height: 200)
            .cornerRadius(10)
            
            Color.white
            .frame(height: 200)
            .cornerRadius(10)
                .mask(
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: .init(colors: [.clear, Color.white.opacity(0.48), .clear]), startPoint: .top, endPoint: .bottom
                        ))
                        .rotationEffect(.init(degrees: 70))
                        .offset(x: show ? center : -center)
                )
        }
        .padding(.horizontal)
        .padding(.top)
        .onAppear() {
            withAnimation(Animation.default.speed(0.15).delay(0)
                .repeatForever(autoreverses: false)) {
                    self.show.toggle()
                }
        }
    }
}

struct ShimmerCardListView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                TextShimmer()
                ForEach(0...10, id: \.self) { _ in
                    CardShimmer()
                }
            }
        }
    }
}
