//
//  Design.swift
//  TrainingApp
//
//  Created by Abdulrahim on 22/07/1445 AH.
//

import SwiftUI
let imageModel: [String] = ["img1", "img2", "img1", "img2", "img1", "img2", "img1", "img2"]
let subjects = ["Computer Science", "Biology", "Physics", "Math"]


struct Design: View {
    @State var search: String = ""

    
    var body: some View {
        VStack{
            ZStack(alignment: .top) {
                Color.indigo
                    .opacity(0.9)
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "bell.badge.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
                    
                    VStack {
                        Text("Design")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.leading)
                        Text("Explore by Topics")
                            .bold()
                            .foregroundColor(.black.opacity(0.2))
                            .padding(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        TextField("", text: $search)
                            .overlay(
                                Text("Search")
                                    .foregroundColor(.gray)
                                    .padding()
                            )
                            .overlay(
                                Image(systemName: "magnifyingglass")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            )
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(8)
                        
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                
                            }
                        }
            DesignScrollView()
        
    }
}

#Preview{
    Design()
}
