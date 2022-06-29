//
//  GameGridsView.swift
//  Number-Merge-iOS-Game
//
//  
//

import SwiftUI

struct GameGridsView: View {
    
    @Binding var game : Game
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 5), spacing: 10) {
            ForEach(0..<25) { index in
                if game.grids[index].value == 0 {
                    GeometryReader { geo in
                        Rectangle()
                            .frame(width: .infinity, height: geo.size.width)
                            .foregroundColor(game.grids[index].gridColor)
                            .cornerRadius(8)
                    }
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        game.grids[index].value = game.randomGrid.value
                        game.checkMerge(index: index)
                        game.nextRandomGrid()
                        game.checkEnd()
                    }
                } else {
                    GeometryReader { geo in
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity, height: geo.size.width)
                                .foregroundColor(game.grids[index].gridColor.opacity(game.isEnd ? 0.7 : 1))
                                .cornerRadius(8)
                            
                            Text("\(game.grids[index].value)")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(game.grids[index].textColor.opacity(game.isEnd ? 0.7 : 1))
                        }
                    }
                    .aspectRatio(contentMode: .fit)
                }
            }
        }
        .padding()
        .background(Color(red: 129/255, green: 123/255, blue: 121/255, opacity: game.isEnd ? 0.7 : 1))
        .cornerRadius(5)
        .padding(.bottom)
        .overlay {
            if game.isEnd {
                VStack {
                    Text("Game Over")
                        .bold()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(red: 120/255, green: 111/255, blue: 102/255))
                    
                    Button {
                        game.restartGame()
                    } label: {
                        Text("Try again")
                            .bold()
                            .font(.title)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 30)
                            .foregroundColor(Color(red: 239/255, green: 228/255, blue: 218/255))
                            .background(Color(red: 120/255, green: 111/255, blue: 102/255))
                            .cornerRadius(5)
                    }
                }
            }
        }
        
        HStack(spacing: 10) {
            ZStack {
                Rectangle()
                    .frame(width: .infinity, height: 65)
                    .foregroundColor(Color(red: 129/255, green: 123/255, blue: 121/255))
                    .cornerRadius(8)
                
                Text("SCORE  \(game.score)")
                    .font(.largeTitle.bold())
                    .foregroundColor(game.randomGrid.textColor)
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(game.randomGrid.gridColor)
                    .cornerRadius(8)
                
                Text("\(game.randomGrid.value)")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(game.randomGrid.textColor)
            }
        }
    }
}
