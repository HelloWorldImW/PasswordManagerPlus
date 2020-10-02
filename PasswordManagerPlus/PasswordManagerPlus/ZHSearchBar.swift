//
//  ZHSearchBar.swift
//  PasswordManagerPlus
//
//  Created by Joe on 2020/10/2.
//

import SwiftUI

struct ZHSearchBar: View {
    @State var searchStr:String = ""
    var searchPlaceholder: String = "搜索..."
    var searchBtnTitle: String = "搜索"
    
    var searchCallback: ((String) -> Void)? = nil
    
    var body: some View {
        HStack {
            Spacer(minLength: 20)
            TextField(searchPlaceholder,text: $searchStr)
                .keyboardType(.decimalPad)
                .frame(height:40)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .border(Color.orange)
                .cornerRadius(2)
            Spacer(minLength: 10)
            Button(searchBtnTitle, action: {
                if let callback = searchCallback {
                    callback(searchStr)
                }
            }).frame(width: 80, height: 30, alignment: .center)
            .border(Color.blue)
            .cornerRadius(2)
            Spacer(minLength: 20)
        }
    }
}

struct ZHSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZHSearchBar()
    }
}
