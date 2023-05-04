//
//  UpdatedTagListScreen.swift
//  trying
//
//  Created by Nirajan on 4/5/2023.
//

import SwiftUI

struct UpdatedTagListScreen: View {
    var body: some View {
        List {
            UpdatedTagRowView()
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
    }
}

struct UpdatedTagListScreen_Previews: PreviewProvider {
    static var previews: some View {
        UpdatedTagListScreen()
    }
}
