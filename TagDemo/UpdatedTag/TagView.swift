//
//  TagView.swift
//  trying
//
//  Created by Nirajan on 4/5/2023.
//

import SwiftUI

struct TagView: View {
    let content: String
    let color: Color
    let action: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(content)
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            
            Button(action: action ?? {}) {
                Image(systemName: "xmark.circle")
                    .foregroundColor(Color.gray)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
        }
        .background(color)
        .cornerRadius(8.0)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(content: "sdfsdfsdfsdf sdfsdf sdfsdfsdf sdfsd fsd fsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdf", color: .green, action: {
            
        })
    }
}
