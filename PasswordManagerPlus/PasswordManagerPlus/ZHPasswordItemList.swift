//
//  ZHPasswordItemList.swift
//  PasswordManagerPlus
//
//  Created by Joe on 2020/10/2.
//

import SwiftUI

struct ZHPasswordItem: Hashable, Identifiable {
    var id = UUID()
    var title: String
}

struct ZHPasswordItemView: View {
    
    @State var passwordItem: ZHPasswordItem
    
    let colors: [Color] = [.orange, .blue, .red, .green, .gray, .pink, .purple]
    
    var body: some View {
        VStack {
            Text("1")
            Spacer()
        }.frame(width: 375/2.2, height: 375/3.0).padding(4.0).background(colors.randomElement()).cornerRadius(10)
    }
}

struct ZHPasswordItemList: View {
    @State var dataList: [ZHPasswordItem] = [] {
        didSet {
            self.showDatas = dataList
        }
    }
    @State var showDatas : [ZHPasswordItem] = []
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack {
            Spacer()
            ZHSearchBar { (searchStr) in
                if searchStr.isEmpty {
                    showDatas = dataList
                } else {
                    showDatas = dataList.filter{$0.title.contains(searchStr)}
                }
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(showDatas, id: \.title) { item in
                        ZHPasswordItemView(passwordItem: item)
                    }
                }.padding()
            }
            Spacer()
        }
    }
}

struct ZHPasswordItemList_Previews: PreviewProvider {
    static var previews: some View {
        ZHPasswordItemList()
    }
}
