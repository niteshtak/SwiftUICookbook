//
//  HorizontalListItem.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 20/11/21.
//

import SwiftUI

struct HorizontalListItemView: View {
    
    let user: User
    @State private var initialImage = UIImage()
    
    var body: some View {
        VStack {
            Image(uiImage: self.initialImage)
                .resizable()
                .cornerRadius(50)
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 100, alignment: .center)
                .onAppear {
                    guard let url = URL(string: self.user.avatar) else { return }
                    URLSession.shared.dataTask(with: url) { (data, response, error) in
                        guard let data = data else { return }
                        guard let image = UIImage(data: data) else { return }
                        
                        DispatchQueue.main.async {
                            self.initialImage = image
                        }
                        
                    }.resume()
                }
            
            Text(user.first_name + " " + user.last_name)
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
    }
}
