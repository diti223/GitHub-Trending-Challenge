//
//  ContentView.swift
//  Trend
//
//  Created by Adrian Bilescu on 30.06.2022.
//

import SwiftUI
import PresentationTrend
import CoreTrend

struct RootView: View {
    @EnvironmentObject var dependencies: Dependencies
    var repositoryFetcher: RepositoryFetcher {
        MainQueueRepositoryFetcherDecorator(fetcher: dependencies.repositoryFetcher)
    }
    
    var listViewModel: RepositoriesListViewModel {
        RepositoriesListViewModel(fetcher: repositoryFetcher)
    }
    
    @State var hasEnteredApp = false
    var body: some View {
        if hasEnteredApp {
            HomeView(viewModel: listViewModel)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .transition(.move(edge: .trailing))
        } else {
            WelcomeView {
                withAnimation {
                    hasEnteredApp = true
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .transition(.opacity.combined(with: .move(edge: .leading)).animation(.easeOut))
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(hasEnteredApp: false)
        RootView(hasEnteredApp: true)
        
    }
}


extension UIApplication {
    var activeWindow: UIWindow? {
        self.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?
            .windows
            .first(where: \.isKeyWindow)
    }
}
