//
//  TitleView.swift
//  Number-Merge-iOS-Game
//
//  
//

import SwiftUI

struct TitleView: View {
    
    @Binding var game : Game
    
    var body: some View {
        HStack {
            Text("Number Merge")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.black)
            
            Spacer()
            
            Text("BEST \(game.bestScore)")
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .frame(width: 120)
                .background(Color(red: 236/255, green: 140/255, blue: 85/255))
                .cornerRadius(5)
        }
    }
}
