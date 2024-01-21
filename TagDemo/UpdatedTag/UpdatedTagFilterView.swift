//
//  UpdatedTagFilterView.swift
//  trying
//
//  Created by Nirajan on 4/5/2023.
//

import SwiftUI

struct UpdatedTagFilterView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    // MARK: - properties
    @State private var size: CGSize = .zero
    @State private var elementsSize: [Data.Element: CGSize] = [:]
    
    let data: Data
    let alignment: HorizontalAlignment = .leading
    let spacing: CGFloat
    let content: (Data.Element) -> Content
    
    // MARK: - body
    var body: some View {
        VStack {
            GeometryReader { proxy in
                VStack(alignment: alignment, spacing: spacing) {
                    ForEach(computeRows(availableWidth: proxy.size.width), id: \.self) { rowElements in
                        HStack(spacing: spacing) {
                            ForEach(rowElements, id: \.self) { element in
                                content(element)
                                    .readSize { size in
                                        elementsSize[element] = size
                                    }
                            }
                        }
                    }
                    
//                    Text("\(size.width) \(size.height) \(availableWidth)")
                    Text("\(size.width) \(size.height) ")
                    
                }
                .readSize { size in
                    DispatchQueue.main.async {
                        self.size = size
                    }
                }
            }
            .frame(height: size.height)
        }
    }
    
    func computeRows(availableWidth: CGFloat) -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth - spacing
        
        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            
            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                // start a new row
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            
            remainingWidth = remainingWidth - (elementSize.width + spacing)
        }
        
        return rows
    }
}

struct UpdatedTagFilterView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatedTagFilterView(data: Examples().data2, spacing: 8) { item in
            TagView(content: item, color: .green, action: nil)
        }
    }
}
