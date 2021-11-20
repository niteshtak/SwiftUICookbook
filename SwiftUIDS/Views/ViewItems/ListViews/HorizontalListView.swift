//
//  HorizontalListView.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 20/11/21.
//

import SwiftUI

struct HorizontalListView: View {
    
    @State private var userData = [User]()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(userData,id: \.id) { user in
                            HorizontalListItemView(user: user)
                        }
                    }
                    .padding(.top, 10)
                }
                .frame(height: 150)
                Spacer()
            }
            .padding(.leading, 10)
            .navigationBarTitle("Users", displayMode: .large)
            .onAppear(perform: getUsers)
        }
    }
}

// Using this free API to fetch user list data
extension HorizontalListView {
    func getUsers() {
        guard let url = URL(string: "https://reqres.in/api/users")
        else {  return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let responseObj = try?
                    JSONDecoder().decode(UserDetail.self, from: data) {
                    DispatchQueue.main.async {
                        self.userData = responseObj.data
                    }
                }
            }
        }.resume()
    }
}
