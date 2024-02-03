import SwiftUI

struct CS: View {

    var body: some View {
        VStack {
            ZStack {
                Color.indigo
                    .opacity(0.9)
                    .frame(height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

                VStack {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "bookmark.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 20)

                    VStack {
                        Text("Computer Science Intro")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                }
            }
            .ignoresSafeArea()

            VStack{
                Image("computerScience")
                    .resizable()
                    .frame(width: 350, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            .padding(.bottom, 20)

            HStack{
                Text("Notes")
                    .foregroundStyle(.gray)
                    .padding(.trailing, 40)
                Text("Lectures")
                    .padding(.trailing, 40)
                    .underline(pattern: .solid)
                    .bold()
                Text("Questions")
                    .foregroundStyle(.gray)
            }
            VStack{
                HStack{
                    Image("img1")
                        .resizable()
                        .frame(width: 150, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .overlay(
                            Image(systemName: "play.fill")
                                .font(.title)
                                .foregroundColor(.black)
                        )
                    
                    Image("img2")
                        .resizable()
                        .frame(width: 150, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .overlay(
                            Image(systemName: "play.fill")
                                .font(.title)
                                .foregroundColor(.black)
                        )
                }
                HStack{
                    Text("01")
                        .padding(.trailing, 140)
                        .bold()
                    Text("02")
                        .bold()
                }
            }
            
            .padding(.top, 40)
            Spacer()
            
                        
        }
        
    }
    
}

#Preview {
    CS()
}

