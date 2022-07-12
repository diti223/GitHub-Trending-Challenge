//
//  HomeView.swift
//  Trend
//
//  Created by Adrian Bilescu on 30.06.2022.
//

import SwiftUI
import PresentationTrend
import CoreTrend


struct HomeView: View {
    @Namespace private var namespace
    @ObservedObject var viewModel: RepositoriesListViewModel
    @EnvironmentObject var dependencies: Dependencies
    
    var selectedRepository: Repository? {
        guard let selectedIndex = selectedIndex else {
            return nil
        }
        return viewModel.list[selectedIndex]
    }
    @State var selectedIndex: Int?
    @State var isRefreshAnimationActive = false
    var body: some View {
        NavigationView {
            ZStack {
                listView
                    .navigationBarTitleDisplayMode(.large)
            }
        }
    }
    @Namespace var selectedNameSpace
    @ViewBuilder
    var listView: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(viewModel.list.indices, id: \.self) { index in
                    NavigationLink(destination: makeDetailView(at: index), label: {
                        makeView(at: index)
                            .foregroundColor(.black)
                            .contentShape(Rectangle())
                    })
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    viewModel.fetchData()
                }, label: {
                    refreshImage
                        .rotationEffect(refreshRotationAngle, anchor: .center)
                        .animation(.linear(duration: 0.5), value: refreshRotationAngle)
                })
            }
        })
        .onReceive(viewModel.$isLoading, perform: { isLoading in
            refreshRotationAngle = Angle(degrees: refreshRotationAngle.degrees + (isLoading ? Double(360) : Double(0)))
        })
        .onAppear(perform: viewModel.viewDidAppear)
        .navigationBarTitle("Trending")
        .listStyle(PlainListStyle())
    }
    @State var refreshRotationAngle = Angle.degrees(0)
    
    @ViewBuilder
    var refreshImage: some View {
        ZStack {
            Color.clear
                .frame(width: 30, height: 35)
            Image(systemName: "arrow.clockwise")
                .padding(.bottom, 5)
        }
    }
    
    @ViewBuilder
    func makeDetailView(at index: Int) -> some View {
        RepositoryDetailView(viewModel: RepositoryViewModel(repository: viewModel.list[index], httpClient: dependencies.httpClient))
    }
    
    @ViewBuilder
    var selectedRepoView: some View {
        if let selectedIndex = selectedIndex {
            makeView(at: selectedIndex)
                .frame(maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    func makeView(at index: Int) -> some View {
        let repository = viewModel.list[index]
        RepositoryView(repository: repository)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.yellow)
            .cornerRadius(20)
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: RepositoriesListViewModel(fetcher: DummyRepositoryFetcher()))
    }
}

extension View {
    @ViewBuilder
    func addTitle(_ title: String) -> some View {
        self.navigationTitle("Trending")
    }
}

class MainQueueHTTPClientDecorator: HTTPClient {
    
    override func fetchData(from request: URLRequest, completion: @escaping ((Data?) -> Void)) {
        super.fetchData(from: request) { data in
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
