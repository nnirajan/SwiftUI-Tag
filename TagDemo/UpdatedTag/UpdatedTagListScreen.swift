//
//  UpdatedTagListScreen.swift
//  trying
//
//  Created by Nirajan on 4/5/2023.
//

import SwiftUI

struct UpdatedTagListScreen: View {
    let datas = [
        Examples().data,
        Examples().data1,
        Examples().data2,
        Examples().data3,
        Examples().data4,
        Examples().data5,
    ]
    
    var body: some View {
        List {
            ForEach(datas, id: \.self) { data in
                UpdatedTagRowView(data: data)
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        
//        ScrollView {
//            LazyVStack {
//                ForEach(datas, id: \.self) { data in
//                    UpdatedTagRowView(data: data)
//                }
//            }
//        }
    }
}

struct UpdatedTagListScreen_Previews: PreviewProvider {
    static var previews: some View {
        UpdatedTagListScreen()
    }
}
