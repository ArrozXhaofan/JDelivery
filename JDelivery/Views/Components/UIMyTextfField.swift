//
//  UITextfField.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import SwiftUI

struct UIMyTextfField: View {
    
    @Binding var value: String
    var prompt: String
    var width: CGFloat?
    var type: UIKeyboardType?
    var capitalizacion: TextInputAutocapitalization
    
    var body: some View {
        HStack {
            
            TextField(prompt, text: $value)
                .padding(.horizontal)
                .textInputAutocapitalization(capitalizacion)
                .keyboardType(type ?? .default)
        }
        .frame(width: width ?? 320, height: 35)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 0.5)
        }
    }
}

#Preview {
    UIMyTextfField(value: .constant(""), prompt: "My UITextField", capitalizacion: .words)
}
