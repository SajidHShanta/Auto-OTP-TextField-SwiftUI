//
//  VerifyOTPView.swift
//  AutoOTP-TextField
//
//  Created by Sajid Shanta on 24/12/22.
//

import SwiftUI

struct VerifyOTPView: View {
    
    let otpLength: Int = 6
    @State var otpText: String = ""
    
    var body: some View {
        VStack {
            Text("Verify OTP")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("", text: $otpText )

            Button {
                
            } label: {
                Text("Verify")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.primary)
                    }
            }
            .disableWithOpacity(otpText.count < otpLength)
            
            
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct VerifyOTPView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}
