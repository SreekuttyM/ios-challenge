//
//  CarouselView.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 02/06/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct CarouselView: View {
    var items: [String]
    @State private var selectedImageIndex: Int = 0

    var body: some View {
        ZStack {
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<items.count, id: \.self) { index in
                    scrollableContent(index: index)
                        .tag(index)
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            
            HStack {
                ForEach(0..<items.count, id: \.self) { index in
                    circleDot(index: index)

                }
                .offset(y: 130)
                
            }
            
        }
    }
    
    
    private func scrollableContent(index:Int) -> some View {
        return ZStack(alignment: .topLeading) {
            WebImage(url: URL(string:items[index]))
                .resizable()
                .shadow(radius: 20)
        }
    }
    
    private func circleDot(index:Int) -> some View {
        Circle()
            .fill(Color.accentColor.opacity(selectedImageIndex == index ? 1 : 0.33))
            .frame(height: 8)
            .onTapGesture {
                selectedImageIndex = index
            }
    }
   
}

#Preview {
    CarouselView(items: [
        "https://img4.idealista.com/blur/480_360_mq/0/id.pro.es.image.master/aa/c2/63/1217034679.webp",
        "https://img4.idealista.com/blur/480_360_mq/0/id.pro.es.image.master/aa/c2/63/1217034679.webp",
        "https://img4.idealista.com/blur/480_360_mq/0/id.pro.es.image.master/aa/c2/63/1217034679.webp"
    ])
    .padding()
}
