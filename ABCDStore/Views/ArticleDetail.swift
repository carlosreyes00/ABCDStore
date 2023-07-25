//
//  ArticleDetail.swift
//  ABCDStore
//
//  Created by Carlos Rafael Reyes Magadán on 12/29/22.
//

import SwiftUI

struct ArticleDetail: View {
    let article: Article
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            article.image!
                .resizable()
                .blur(radius: 25)
//                .colorMultiply(.accentColor.opacity(1)).blendMode(.lighten)
                .padding(-50)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                article.image!
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(25)
                    .padding()
                    .shadow(color: .details.opacity(0.5), radius: 3)
                
                Spacer()
                
                Text("\(article.size.rawValue)")
                    .font(.title3)
                    .bold()
                    .lineLimit(1)
                
                Text("$\(article.price.formatted())")
                    .font(.title3)
                    .bold()
                    .lineLimit(1)
                
                Spacer()
                
                Text("\(article.name)")
                    .font(.body)
                    .bold()
                    .lineSpacing(-1)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Spacer()
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(article: .init(name: "Blue navy jean new of pack, 0 kil, es elastizado, está tiza, n nefeafe aef  aefae  aef  aefe afaefaef está tiza", image: Image("photo01"), price: 59.99, size: .XXL, gender: .Men, category: .shoes))
    }
}
