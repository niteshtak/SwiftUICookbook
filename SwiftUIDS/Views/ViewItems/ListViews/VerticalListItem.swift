//
//  VerticalList.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 9/11/21.
//

import SwiftUI
import Foundation

struct VerticalListItemView: View {
    
    let user: User
    @State var initialImage = UIImage()
    
    var body: some View {
        HStack {
            Image(uiImage: self.initialImage)
                .resizable()
                .cornerRadius(25)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .onAppear {
                    guard let url = URL(string: self.user.avatar) else { return }
                    URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                        guard let data = data else { return }
                        guard let image = UIImage(data: data) else { return }
                        
                        DispatchQueue.main.async {
                            self.initialImage = image
                        }
                    }.resume()
                }.padding(10)
            
            Text(user.first_name + " " + user.last_name)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
        }
    }
}
