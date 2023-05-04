//
//  UpdatedTagFilterView.swift
//  trying
//
//  Created by Nirajan on 4/5/2023.
//

import SwiftUI

struct UpdatedTagFilterView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    @State private var size: CGSize = .zero
    @State private var availableWidth: CGFloat = 5
    @State private var elementsSize: [Data.Element: CGSize] = [:]
    
    let data: Data
    let alignment: HorizontalAlignment = .leading
    let spacing: CGFloat
    let content: (Data.Element) -> Content
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ZStack {
                    VStack(alignment: alignment, spacing: spacing) {
                        ForEach(computeRows(), id: \.self) { rowElements in
                            HStack(spacing: spacing) {
                                ForEach(rowElements, id: \.self) { element in
                                    content(element)
                                        .readSize { size in
                                            elementsSize[element] = size
                                        }
                                    
//                                    Text("\(elementsSize[element]?.height ?? 0)")
                                }
                            }
                        }
                        
                        Text("\(size.width) \(size.height) \(availableWidth)")
                    }
                }
                .readSize { size in
                    self.size = size
                    availableWidth = size.width
                }
            }
            .frame(height: size.height)
        }
    }
    
    func computeRows() -> [[Data.Element]] {
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
    @State static var dataEg: [String] = ["ram ram ram ram", "hari hari hari hari hari hari hari hari hari hari hari hari harihari hari", "sdfsdfsdfsdf sdfsdf sdfsdfsdf sdfsd fsd fsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdf"]
    
//    @State static var dataEg: [String] = ["purebred", "desexeddesexeddesexeddesexeddesexeddesexeddesexeddesexeddesexeddesexed"]
    
    static var previews: some View {
        UpdatedTagFilterView(data: dataEg, spacing: 8) { item in
            Text(item)
                .lineLimit(nil)
        }
        
    }
}
