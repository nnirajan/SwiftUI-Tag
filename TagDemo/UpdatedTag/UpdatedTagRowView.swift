//
//  UpdatedTagRowView.swift
//  trying
//
//  Created by Nirajan on 4/5/2023.
//

import SwiftUI

struct UpdatedTagRowView: View {
    private let data: [String]
    
    init(data: [String]) {
        self.data = data
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Title text")
            
            UpdatedTagFilterView(data: data, spacing: 8) { item in
                TagView(content: item, color: .red, action: nil)
            }
        }
        .padding()
    }
}

struct UpdatedTagRowView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatedTagRowView(data: Examples().data2)
    }
}
