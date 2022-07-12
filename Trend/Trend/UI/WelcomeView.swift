//
//  WelcomeView.swift
//  Trend
//
//  Created by Adrian Bilescu on 30.06.2022.
//

import SwiftUI

private extension Color {
    static let background = Color(red: 34/255.0, green: 42/255.0, blue: 56/255.0).opacity(0.8)
}

struct WelcomeView: View {
    var onCompletion: () -> Void
    
    @State private var showPrivacyPolicy = false
    @State private var showTermsOfUse = false
    @State private var showWebPage = false
    
    var body: some View {
        VStack {
            headerView
            Spacer()
            titleView
            subtitleView
                .padding()
            Spacer()
            enterAppButton
            footerView
                .opacity(0.7)
                .padding(.vertical, 20)
        }
        .sheet(isPresented: $showWebPage, content: {
            makeWebView(urlString: "https://www.adrianbilescu.com/")
                
        })
        .sheet(isPresented: $showPrivacyPolicy, content: {
            makeWebView(urlString: "https://legal.com/privacy-policy/")
        })
        .sheet(isPresented: $showTermsOfUse, content: {
            makeWebView(urlString: "https://legal.com/terms-use/")
        })
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background
            .ignoresSafeArea()
                    )
        .foregroundColor(.white)
    }
    
    private func makeWebView(urlString: String) -> some View {
        WebViewContainer(url: URL(string: urlString)!)
            .ignoresSafeArea(edges: .bottom)
    }
    
    @ViewBuilder
    var headerView: some View {
        HStack {
            Spacer()
            Button(action: {
                showWebPage = true
            }, label: {
                Text("Go to Web")
                    .font(.callout)
                    .fontWeight(.heavy)
            })
        }
    }
    
    @ViewBuilder
    var titleView: some View {
        Text("Welcome to iOS Test")
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var subtitleView: some View {
        Text(String.subtitle)
            .foregroundColor(.white)
            .font(.footnote)
            .fontWeight(.medium)
            .padding(.horizontal, 20)
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var enterAppButton: some View {
        ActionButton(text: "Enter the app", action: onCompletion)
    }
    
    @ViewBuilder
    var footerView: some View {
        HStack(spacing: 2) {
            privacyPolicyText
            Text("and")
            termsOfUseText
        }
        .font(.caption)
    }
    
    @ViewBuilder
    var privacyPolicyText: some View {
        Text("Privacy policy")
            .underline()
            .contentShape(Rectangle())
            .onTapGesture {
                showTermsOfUse = true
            }
    }
    
    @ViewBuilder
    var termsOfUseText: some View {
        Text("Terms of use")
            .underline()
            .contentShape(Rectangle())
            .onTapGesture {
                showTermsOfUse = true
            }

    }
}

private extension String {
    static let subtitle = "iOS Test app\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna."
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(onCompletion: {})
    }
}
