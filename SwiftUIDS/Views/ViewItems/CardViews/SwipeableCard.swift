//
//  SwipeableCard.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 21/11/21.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Image("person_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    .clipped()
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        AppLabel(title: "Emma Watson, 25", style: .heading1)
                        AppLabel(title: "Social Worker", style: .heading2)
                    }
                    Spacer()
                }.padding(.horizontal)
            }
            // Add padding, corner radius and shadow with blur radius
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}

struct SwipeableCardView: View {
    
    @State private var translation: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Image("person_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    .clipped()
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        AppLabel(title: "Emma Watson, 25", style: .heading1)
                        AppLabel(title: "Social Worker", style: .heading2)
                    }
                    Spacer()
                }.padding(.horizontal)
            }
            // Add padding, corner radius and shadow with blur radius
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: translation.width, y: 0)
            .rotationEffect(.degrees(Double((self.translation.width/geometry.size.width) * 25)), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                    }.onEnded { value in
                        self.translation = .zero
                    }
            )
        }
    }
}

struct UserData: Hashable, CustomStringConvertible {
    var id: Int
    
    let firstName: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String
    
    var description: String {
        return "\(firstName), id: \(id)"
    }
}

struct CardStackView: View {
    
    // 1
    /// List of users
    @State var users: [UserData] = [
        UserData(id: 0, firstName: "Cindy", lastName: "Jones", age: 23, mutualFriends: 4, imageName: "person_1", occupation: "Coach"),
        UserData(id: 1, firstName: "Mark", lastName: "Bennett", age: 27, mutualFriends: 0, imageName: "person_2", occupation: "Insurance Agent"),
        UserData(id: 2, firstName: "Clayton", lastName: "Delaney", age: 20, mutualFriends: 1, imageName: "person_3", occupation: "Food Scientist"),
        UserData(id: 3, firstName: "Brittni", lastName: "Watson", age: 19, mutualFriends: 4, imageName: "person_4", occupation: "Historian"),
        UserData(id: 4, firstName: "Archie", lastName: "Prater", age: 22, mutualFriends:18, imageName: "person_5", occupation: "Substance Abuse Counselor")
    ]
    
    // 2
    /// Return the CardViews width for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    // 3
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(users.count - 1 - id) * 10
    }
    
    var body: some View {
        VStack {
            // 4
            GeometryReader { geometry in
                // 5
                VStack {
                     // 6
                    ZStack {
                        
                        // 7
                        ForEach(self.users, id: \.self) { user in
                            SwipeableCardView()
                                 // 8
                                .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
                                .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                        }
                    }
                    Spacer()
                }
            }
        }.padding()
    }
}
