//
//  ArticleOverview.swift
//  ABCDStore
//
//  Created by Carlos Rafael Reyes Magadán on 12/29/22.
//

import SwiftUI

extension Color {
    static let background = Color("BackgroundColor")
    static let details = Color("DetailsColor")
}

struct ArticleOverview: View {
    let article: Article
    let spacing = 15.0
    let cornerRadius: CGFloat = 10
    @State var saved = false
    
    var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            PriceAndSizeStack(article: article)
            
            if article.image != nil {
                ArticleImage(image: article.image!, article: article)
            } else {
                ZStack {
                    ArticleImage(image: Image(systemName: "globe"), article: article)
                    Text("something was wrong \n :(")
                        .foregroundColor(.white)
                        .bold()
                        .multilineTextAlignment(.center)
                }
            }
            
            NameAndSavedStack(article: article, saved: $saved)
        }
        .foregroundColor(.details)
        .padding(spacing)
        .background(Color.accentColor.opacity(0.25))
        .cornerRadius(cornerRadius)
    }
}

struct ArticleOverview_Previews: PreviewProvider {
    static var previews: some View {
        ArticleOverview(article: .init(name: "Jean Gapioe Blel reyes magos je", image: nil, price: 59.99, size: .XXL, gender: .Men, category: .shoes))
            .padding()
    }
}

struct ArticleImage: View {
    let image: Image
    let article: Article
    var body: some View {
        Rectangle()
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                image
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(10)
                    .shadow(color: .details.opacity(0.5), radius: 3)
            }
            .overlay(alignment: .topTrailing) {
                if article.new {
                    Text("new")
                        .bold()
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Rectangle()
                            .foregroundColor(Color.red.opacity(0.75))
                            .shadow(radius: 3)
                        )
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct PriceAndSizeStack: View {
    let article: Article
    
    var body: some View {
        HStack {
            Text("\(article.size.rawValue)")
            Spacer()
            Text("$\(article.price.formatted())")
        }
        .font(.callout)
        .bold()
        .lineLimit(1)
        .opacity(0.6)
        .padding(.horizontal, 5)
    }
}
struct NameAndSavedStack: View {
    let article: Article
    @Binding var saved: Bool
    
    var body: some View {
        HStack(spacing: 20.0) {
            Text("\(article.name)")
                .font(.body)
                .bold()
                .lineLimit(1)
                .multilineTextAlignment(.leading)
            Button {
                saved.toggle()
            } label: {
                Image(systemName: saved ? "flag.fill" : "flag")
                    .font(.title2)
            }
        }
    }
}
