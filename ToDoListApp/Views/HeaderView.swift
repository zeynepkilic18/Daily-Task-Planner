//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Zeynep Kılıç on 11.02.2026.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0).foregroundColor(backgroundColor).rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title).foregroundColor(Color.white).font(.system(size: 50)).bold()
                Text(subtitle).font(.system(size: 30)).foregroundColor(Color.white)
            }
            .padding(.top, 80)
            
        }
        .frame(width:UIScreen.main.bounds.width * 3,height: 300).offset(y: -150)

    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, backgroundColor: .blue)
}
