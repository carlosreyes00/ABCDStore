//
//  ContentView.swift
//  ABCDStore
//
//  Created by Carlos Rafael Reyes Magadán on 12/29/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var store = Store()
    
    @State var selectedSize = Size.allCases.first!
    @State var selectedCategory = Category.allCases.first!
    
    @State private var selectedTab = Gender.allCases.first!.rawValue
    
    private var colors: [Color] = [.pink, .orange, .red, .black, .blue, .cyan, .teal, .green]
    @State private var selectedColor = 0
    @State private var rotation = Angle(degrees: 0)
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(store.inventory.filter({ $0.new })) {                       ArticleOverview(article: $0)
                                .frame(width: 170)
                        }
                    }
                    .padding(.horizontal, 15)
                }
                
                Text("info info info")
                    .textCase(.uppercase)
                    .foregroundColor(colors[selectedColor])
                    .bold()
                
                TabView(selection: $selectedTab) {
                    ForEach(Gender.allCases, id: \.self) { gender in
                        GenderPageView(store: store, gender: gender)
                            .tabItem {
                                Label("\(gender.rawValue)", systemImage: "button.programmable")
                            }
                            .tag(gender.rawValue)
                            .rotationEffect(rotation)
                    }
                    Pickers(selectedSize: $selectedSize, selectedCategory: $selectedCategory)
                        .tabItem {
                            Label("Explore", systemImage: "magnifyingglass")
                        }
                        .tag("Explore")
                }
                .onChange(of: selectedTab) { _ in
                    withAnimation(.spring(dampingFraction: 0.25).speed(10)) {
                        selectedColor = Int.random(in: 0..<colors.count)
                        rotation = Angle.degrees(Double.random(in: 0..<360))
                    }
                }
            }
        }
    }
}

struct GenderPageView: View {
    @ObservedObject var store: Store
    let gender: Gender
    
    let widthScreen = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack {
            HStack {
                Text(gender.rawValue)
                switch gender {
                case .Men:
                    Image(systemName: "mustache.fill")
                case .Women:
                    Image(systemName: "camera.macro")
                case .Unisex:
                    Image(systemName: "figure.dress.line.vertical.figure")
                }
            }
            
            Spacer()
            
            NavigationLink(destination: ArticlesByGender(store: store, gender: gender)) {
                Text("Go to shop")
            }
            .font(.title3)
            .bold()
            
            Spacer()
        }
        .padding()
        .frame(width: widthScreen - 30)
        .foregroundColor(.accentColor)
        .font(.title)
        .bold()
    }
}

struct HeaderMainPage: View {
    var body: some View {
        Group {
            Image(systemName: "giftcard.fill")
            Text("ABCD")
        }
        .font(.system(size: 100))
        .bold()
        .foregroundColor(.accentColor)
    }
}

struct Pickers: View {
    @Binding var selectedSize: Size
    @Binding var selectedCategory: Category
    
    let widthScreen = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Size")
            Picker("Size", selection: $selectedSize) {
                ForEach(Size.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            Text("Category")
            Picker("Category", selection: $selectedCategory) {
                ForEach(Category.allCases, id: \.self) {
                    Text($0.rawValue.capitalized)
                }
            }
        }
        .padding()
        .frame(width: widthScreen - 30)
        .background(Color.background)
        .cornerRadius(15)
        .font(.callout)
        .pickerStyle(.segmented)
        .shadow(radius: 15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
