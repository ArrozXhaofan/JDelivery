//
//  UIButton.swift
//  JDelivery
//
//  Created by Jeanpiere Laura on 17/03/25.
//

import SwiftUI

struct UIMyButton: View {
    
    var text: String
    var width: CGFloat?
    var height: CGFloat?
    var action: () -> Void = {}
    
    @State private var loading = false
    
    var body: some View {
        
        VStack {
            if loading {
                ProgressView()
                    .frame(width: width ?? 320, height: height ?? 35)
                
            } else {
                Button {
                    loading = true
                    action()
                    loading = false
                } label: {
                    VStack {
                        Text(text)
                            .padding(5)
                            .foregroundStyle(.black)
                            .font(.system(size: 17, weight: .semibold))
                    }
                    .frame(width: width ?? 320, height: height ?? 35)
                    .background {
                        RoundedRectangle(cornerRadius: 7)
                            .foregroundStyle(.mint)
                    }
                }
            }
        }
    }
}

#Preview {
    UIMyButton(text: "Inciar sesion") {}
}
