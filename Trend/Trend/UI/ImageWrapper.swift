//
//  ImageWrapper.swift
//  Trend
//
//  Created by Adrian Bilescu on 08.07.2022.
//

import SwiftUI
import Kingfisher

struct ImageWrapper: View {
    var url: URL?
    
    @ViewBuilder
    var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: url, content: { image in
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 44, height: 44)
                    image.image?
                        .resizable()
                        .frame(width: 40, height: 40)
                        .mask {
                            Circle()
                        }
                }
            })
        } else {
            KFImage(url)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(.white)
                        .frame(width: 44, height: 44)
                )
        }
    }
}
