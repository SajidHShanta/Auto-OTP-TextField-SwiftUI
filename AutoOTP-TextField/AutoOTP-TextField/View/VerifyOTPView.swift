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
            
            HStack(spacing: 0) {
                // otp text box
                ForEach(0..<otpLength, id: \.self) { index in
                    otpTextBox(index)
                }
            }
            .padding()
            
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
    
    @ViewBuilder
    func otpTextBox(_ index: Int) -> some View {
        ZStack {
            if otpText.count > index {
                
            } else {
                Text("")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            RoundedRectangle(cornerRadius: 6, style:  .continuous)
                .stroke(.gray, lineWidth: 0.5)
        }
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
