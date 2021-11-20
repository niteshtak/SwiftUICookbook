//
//  AppTextFields.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 5/9/21.
//

import SwiftUI

struct NameTextField: View {
    
    @State var text = ""
    
    var body: some View {
        TextField("Enter Name", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(10)
    }
}

struct RoundedBorderTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
    }
}

struct NameTextFieldWithImage: View {
    
    @State var text = ""
    
    var body: some View {
        HStack {
          Image(systemName: "person").foregroundColor(.gray)
          TextField("Enter your Email", text: $text)
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
        .padding(10)
    }
}
