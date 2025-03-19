//
//  UIMySecureField.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import SwiftUI

struct UIMySecureField: View {
    
    @Binding var value: String
    var prompt: String
    var width: CGFloat?
    var type: UIKeyboardType?
    
    @State private var isVisible = false
    
    var body: some View {
        
        HStack {
            
            if !isVisible {
                SecureField(prompt, text: $value)
                    .padding(.horizontal)
                    .textInputAutocapitalization( .never)
                    .keyboardType(type ?? .default)
                
            } else {
                TextField(prompt, text: $value)
                    .padding(.horizontal)
                    .textInputAutocapitalization( .never)
                    .keyboardType(type ?? .default)
            }
            
            Spacer()
            
            Button {
                withAnimation(.bouncy(duration: 0.3)) {
                    isVisible.toggle()
                }
            } label: {
                if !isVisible {
                    Image(systemName: "eye.fill")
                        .padding(.horizontal, 10)
                        .foregroundStyle(.gray)
                    
                } else {
                    Image(systemName: "eye.slash")
                        .padding(.horizontal, 10)
                        .foregroundStyle(.gray)
                }
            }

        }
        .frame(width: width ?? 320, height: 35)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 0.5)
        }
    }
}

#Preview {
    UIMySecureField(value: .constant(""), prompt: "My Secure Field")
}
