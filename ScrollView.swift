// DesignScrollView.swift

import SwiftUI

struct DesignScrollView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(0..<imageModel.count/2, id: \.self) { rowIndex in
                    HStack {
                        ForEach(rowIndex*2..<(rowIndex*2)+2, id: \.self) { innerIndex in
                            let imageName = imageModel[innerIndex]
                            let subjectIndex = innerIndex % subjects.count
                            let subject = subjects[subjectIndex]
                            
                            VStack {
                                ZStack(alignment: .bottomLeading) {
                                    Image(imageName)
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                        .frame(width: 160, height: 100)
                                        .padding()
                                    
                                    Text(subject)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(Color.black.opacity(0.5))
                                        .cornerRadius(4)
                                        .offset(x: 24, y: -16)
                                    
                                }
                                .frame(width: 140, height: 140)
                                .cornerRadius(8)
                                
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}
