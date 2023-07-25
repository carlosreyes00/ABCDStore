//
//  ArticlesByGender.swift
//  ABCDStore
//
//  Created by Carlos Rafael Reyes Magadán on 12/29/22.
//

import SwiftUI

struct ArticlesByGender: View {
    @ObservedObject var store: Store
    @Environment(\.presentationMode) private var presentationMode
    @State private var showDetails = false
    @State private var articleForDetails = Article(name: "Blue navy", image: Image("photo01"), price: 59.99, size: .XXL, gender: .Men, category: .shoes)
    
    let gender: Gender
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [.init(),.init()]) {
                ForEach(store.inventory.filter({ $0.gender == gender })) { item in
                    Button {
                        articleForDetails = item
                        showDetails = true
                    } label: {
                        ArticleOverview(article: item)
                    }
                }
            }
        }
        .navigationTitle(gender.rawValue + "(\(store.inventory.filter({ $0.gender == gender }).count))")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                toolbarMenuFilter()
                toolbarMenuSort()
            }
        }
        .padding()
        .foregroundColor(.accentColor)
        .sheet(isPresented: $showDetails) {
            ArticleDetail(article: articleForDetails)
        }
    }
}

struct toolbarMenuFilter: View {
    var body: some View {
        Menu {
            Menu {
                ForEach(Size.allCases, id: \.rawValue) { size in
                    Button("\(size.rawValue)") {
                        //action
                    }
                }
            } label: {
                Label("Size", systemImage: "s.circle")
                    .labelStyle(.iconOnly)
            }
            
            Menu {
                ForEach(Category.allCases, id: \.rawValue) { category in
                    Button("\(category.rawValue)") {
                        //action
                    }
                }
            } label: {
                Label("Category", systemImage: "c.circle")
                    .labelStyle(.iconOnly)
            }
        } label: {
            Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                .labelStyle(.iconOnly)
        }
    }
}
struct toolbarMenuSort: View {
    var body: some View {
        Menu {
            Button("Date") {
                //action
            }
            Button("Price") {
                //action
            }
        } label: {
            Label("Sort", systemImage: "arrow.up.arrow.down.circle")
                .labelStyle(.iconOnly)
        }
    }
}

struct ArticlesByGender_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesByGender(store: Store(), gender: .Men)
    }
}

