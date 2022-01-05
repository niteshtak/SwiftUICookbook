//
//  FaceIdAuth.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 2/1/22.
//

import SwiftUI
import LocalAuthentication

struct FaceIdAuth: View {
    
    @State private var showNoFaceIdAlert: Bool = false
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Logged in with FaceID")
                    .hiddenConditionally(isHidden: false)
            } else {
                AppButton(title: "Login with FaceID", type: .plain) {
                    authenticate()
                }
                .hiddenConditionally(isHidden: isUnlocked)
                .alert(isPresented: $showNoFaceIdAlert) {
                    Alert(title: Text("No FaceId"), message: Text("Use real device iphone X and above"), dismissButton: .default(Text("Done")))
                }
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    isUnlocked = true
                } else {
                    showNoFaceIdAlert = true
                }
            }
        } else {
            showNoFaceIdAlert = true
        }
    }
}

extension View {
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
