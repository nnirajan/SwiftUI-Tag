//
//  UpdatedTagRowView.swift
//  trying
//
//  Created by Nirajan on 4/5/2023.
//

import SwiftUI

struct UpdatedTagRowView: View {
    // fails to load last text
    let data = ["ram ram ram ram", "This is a long sentence", "sdfsdfsdfsdf sdfsdf sdfsdfsdf sdfsd fsd fsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdf"]
    
    // success
    let data1 = ["ram ram ram ram", "This is a long sentence", "This is second long sentence", "sdfsdf", "sdfsdfsdfsdfsdf", "sdfsdfsdfsdfasdf", "sdfsdfsdfsdfsdf sdfsdfsdfsdfsdf sdfsdfsdfsdfsdf sdfsdfsdfsdfsdfsdfsdfwer123"]
    
    let data2 = ["content", "content 2 ", "content 3", "content 4", "content content content content content content content content content content content content content content content content content content content  5", "content6", "content 7", "content 8", "content 9", "content 10"]
    
    let data3 = ["ram ram ram ram", "This is a long sentence", "This is second long sentence", "sdfsdf", "sdfsdfsdfsdfsdf", "sdfsdfsdfsdfasdf", "sdfsdfsdfsdfsdf sdfsdfsdfsdfsdf sdfsdfsdfsdfsdf sdfsdfsdfsdfsdfsdfsdfwer123sdf"]
    
    var body: some View {
        UpdatedTagFilterView(data: data3, spacing: 8) { item in
            TagView(content: item, color: .red, action: nil)
        }
        .padding()
    }
}

struct UpdatedTagRowView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatedTagRowView()
    }
}
