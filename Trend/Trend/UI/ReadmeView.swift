//
//  ReadmeView.swift
//  Trend
//
//  Created by Adrian Bilescu on 09.07.2022.
//

import Foundation
import SwiftUI
import CoreTrend
import MarkdownView
import PresentationTrend

struct ReadmeView: View {
    
    @ObservedObject var viewModel: RepositoryViewModel
    var onTouchLink: ((URLRequest) -> Void)?
    
    init(viewModel: RepositoryViewModel, onTouchLink: ((URLRequest) -> Void)? = nil) {
        self.viewModel = viewModel
        viewModel.fetch()
    }
    
    var body: some View {
        if let markdown = markdown {
            MarkdownUI(body: markdown)
                .onTouchLink { request in
                    onTouchLink?(request)
                    
                    // don't open page in the existing web view displaying the Readme
                    return false
                }
        }
    }
    
    var markdown: String? {
        guard let data = viewModel.fetchedData,
              let string = String(data: data, encoding: .utf8) else {
            return nil
        }
        
        return string
    }
}

struct ReadmeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReadmeView(viewModel: RepositoryViewModel(repository: .preview1, httpClient: HTTPClient(session: .shared)), onTouchLink: { request in
                if let url = request.url {
                    UIApplication.shared.open(url)
                }
            })
        }
    }
}

