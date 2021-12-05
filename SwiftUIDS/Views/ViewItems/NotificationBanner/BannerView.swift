//
//  BannerView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 28/11/21.
//

import SwiftUI
import Foundation

enum BannerStatus {
    case error
    case success
    case warning
    case info
    
    var tintColor: Color {
        switch self {
        case .info:
            return Color.gray
        case .success:
            return Color.green
        case .warning:
            return Color.yellow
        case .error:
            return Color.red
        }
    }
}

struct BannerData {
    let title: String
    let message: String
    let status: BannerStatus
}

//struct Banner: View {
//    
//    let data: BannerData
//    var action: (() -> Void)?
//    
//    var body: some View {
//        ZStack {
//                VStack {
//                    HStack {
//                        // Banner Content Here
//                        VStack(alignment: .leading, spacing: 2) {
//                            Text(data.title)
//                                .bold()
//                            Text(data.message)
//                                .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
//                        }
//                        .foregroundColor(Color.white)
//                        .padding(12)
//                        .background(data.status.tintColor)
//                        .cornerRadius(8)
//                        
//                        Spacer()
//                    }
//                    Spacer()
//                }
//            }
//    }
//}

struct BannerViewModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    @Binding var data: BannerData
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        ZStack {
            if isPresented {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(data.title)
                                .bold()
                            Text(data.message)
                                .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                        }
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .padding(12)
                    .background(data.status.tintColor)
                    .cornerRadius(8)
                    Spacer()
                }
                .padding()
                .animation(.easeInOut)
                .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                .onTapGesture {
                    withAnimation {
                        self.isPresented = false
                    }
                }.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                        withAnimation {
                            self.isPresented = false
                        }
                    }
                })
            }
            content
        }
    }
}

extension View {
    func banner(data: Binding<BannerData>, show: Binding<Bool>, action: (() -> Void)? = nil) -> some View {
        self.modifier(BannerViewModifier(isPresented: show, data: data, action: action))
    }
}
