//
//  ContentView.swift
//  AutoOTP-TextField
//
//  Created by Sajid Shanta on 24/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        /*
         https://stackoverflow.com/questions/73700850/swiftui-navigationview-vs-navigationstack-for-ios-15-16
         */
        if #available(iOS 16, *) {
            NavigationStack {
                VerifyOTPView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden, for: .navigationBar)
            }
        } else {
            NavigationView {
                VerifyOTPView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
