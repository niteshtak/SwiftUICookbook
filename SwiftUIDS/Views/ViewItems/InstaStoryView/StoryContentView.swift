//
//  StoryContentView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 7/5/23.
//

import Foundation
import SwiftUI

struct StoryContentView: View {
    
    var imageNames: [String] = ["0","1","2","3","4"]
    @ObservedObject var storyTimer: StoryTimer = StoryTimer(items: 5, interval: 3.0)

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image(self.imageNames[Int(self.storyTimer.progress)])
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: nil, alignment: .center)
                    .animation(.none)
                HStack(alignment: .center, spacing: 4) {
                    ForEach(self.imageNames.indices) { x in
                        ProgressView(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0) , 1.0) )
                            .frame(width: nil, height: 2, alignment: .leading)
                            .animation(.linear)
                    }
                }.padding()
            }
            .onAppear { self.storyTimer.start() }
            .onDisappear {self.storyTimer.cancel() }
            
            HStack(alignment: .center, spacing: 0) {
                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.storyTimer.advance(by: -1)
                }
                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.storyTimer.advance(by: 1)
                }
            }
        }
        .navigationBarHidden(true)
    }
    
}
