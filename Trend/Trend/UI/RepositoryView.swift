//
//  RepositoryView.swift
//  Trend
//
//  Created by Adrian Bilescu on 05.07.2022.
//

import SwiftUI
import CoreTrend
import PresentationTrend

struct RepositoryView: View {
    var repository: Repository
    
    @ViewBuilder
    func makeLabel(_ string: String, image: String) -> some View {
        HStack(spacing: 2) {
            Image(systemName: image)
                .font(.caption)
            Text(string)
                .font(.caption)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Group {
                Text(repository.author.username) +
                Text("/\(repository.name)")
                    .fontWeight(.bold)
                    .font(.title2)
                }.multilineTextAlignment(.leading)
                Spacer(minLength: 0)
            }
            .padding(2)
            
            if !repository.description.isEmpty {
                Text(repository.description)
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
            }
            
            contributors
            
            HStack(spacing: 4) {
                makeLabel(repository.starsCountDescription, image: "star.fill")
                makeLabel(repository.starsCountDescription, image: "arrow.triangle.branch")
                makeLabel(repository.starsCountDescription, image: "eye.fill")
                
            }.padding(.vertical, 4)
            
            HStack(spacing: 8) {
                ForEach(repository.languages, id: \.self) { language in
                    HStack(spacing: 4) {
                        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)).mask(Circle())
                            .frame(width: 10, height: 10)
                        Text(language)
                            .font(.caption)
                            .lineLimit(1)
                    }
                }
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .cornerRadius(8)
    }
    
    @ViewBuilder
    var contributors: some View {
        if !repository.contributors.isEmpty {
            HStack {
                ZStack {
                    ForEach(repository.contributors.indices.reversed(), id: \.self) { index in
                        let offset: CGFloat = 24 * CGFloat(index)
                        let user = repository.contributors[index]
                        
                        ImageWrapper(url: user.avatarURL)
                            .offset(x: offset, y: 0)
                    }
                }
                
                Color.clear
            }
        }
    }
}





extension Repository: Identifiable {}

extension Repository {
    enum ValueSize: Int {
        case none = 1, thousand = 1_000, million = 1_000_000, billion = 1_000_000_000
        
        var symbol: String {
            switch self {
                case .thousand:
                    return "K"
                case .million:
                    return "M"
                case .billion:
                    return "B"
                case .none:
                    return ""
            }
        }
    }
    
    var starsCountDescription: String {
        Repository.makeCountDescription(value: starsCount)
    }
    
    var forksCountDescription: String {
        Repository.makeCountDescription(value: forksCount)
    }
    
    var watchersCountDescription: String {
        Repository.makeCountDescription(value: watchersCount)
    }
    
    static func makeCountDescription(value: Int) -> String {
        guard let valueSize = [ValueSize.billion, .million, .thousand, .none].first(where: { value / $0.rawValue > 0 }) else {
            return "0"
        }
        
        return "\(value / valueSize.rawValue)\(valueSize.symbol.lowercased())"
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(repository: .preview1)
            .previewLayout(PreviewLayout.fixed(width: 320, height: 240))
    }
}
