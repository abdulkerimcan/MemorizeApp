//
//  AspectVGrid.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 4.06.2024.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRadio: CGFloat = 1
    var content: (Item) -> (ItemView)
    
    init(items: [Item], aspectRadio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRadio = aspectRadio
        self.content = content
    }
    var body: some View {
        GeometryReader(content: { geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: items.count,
                size: geometry.size,
                aspectRadio: aspectRadio)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize),spacing: 0)],spacing: 0, content: {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRadio, contentMode: .fit)
                    
                    
                }
            })
        })
        
        
    }
    
    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        aspectRadio: CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRadio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height {
                return (size.width / columnCount).rounded(.down)
            }
            columnCount += 1
        } while columnCount < count
        
        return min(size.width / count, size.height * aspectRadio).rounded(.down)
    }
}
