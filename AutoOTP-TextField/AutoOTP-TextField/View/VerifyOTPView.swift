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
    
    //keyboard state
    @FocusState private var isKeyboardShowing: Bool
    
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
            .background(content: {
                TextField("", text: $otpText.limit(otpLength))
                //heidng the text feild
                    .frame(width: 1, height: 1)
                    .opacity(0.0001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
                    .keyboardType(.numberPad)
            })
            .containerShape(Rectangle())
            .onTapGesture {
                //open keyboard
                isKeyboardShowing.toggle()
            }
            .padding()
            
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
                //finding char for current index
                let firstIndex = otpText.startIndex
                let currentIndex = otpText.index(firstIndex, offsetBy: index)
                
                Text(String(otpText[currentIndex]))
            } else {
                Text("")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            RoundedRectangle(cornerRadius: 6, style:  .continuous)
                .stroke(.gray, lineWidth: 0.5)
        }
        .frame(maxWidth: .infinity)
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

/*
 Since we only need 6 characters from the TextField as we have only 6 boxes, creating an extension for limiting the binding string to some prescribed limit
 */
// Binding <String> extension
extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
