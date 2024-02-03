import SwiftUI

struct MainPage: View {
    @State var search: String = ""
    
    let imageModel: [String] = ["img1", "img2", "img1", "img2", "img1", "img2", "img1", "img2"]
    let subjects = ["Computer Science", "Biology", "Physics", "Math"]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.indigo
                    .opacity(0.9)
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "bell.badge.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 10)
                    
                    VStack(){
                        Text("Hello, Abdulrahim!")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                        Text("What do you wanna learn today?")
                            .foregroundColor(.gray)
                            .bold()
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
                .padding(.bottom, 48)

            }
            VStack{
                    HStack {
                            Text("Courses")
                                .fontWeight(.bold).foregroundStyle(.indigo)
                                .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                            Text("Materials")
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color.indigo)
                                .cornerRadius(8)
                            
                        .background(Color.gray.opacity(0.3))
                    }
                }
                .padding()
                Divider()

                
                HStack {
                    Text("Last Added")
                        .bold()
                    Spacer()
                    Text("See All")
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(imageModel, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .frame(width: 160, height: 100)
                                .padding()
                                .overlay(
                                    Image(systemName: "play.fill")
                                        .font(.title)
                                        .foregroundColor(.black.opacity(0.7))
                                )
                        }
                    }
                }
                Divider()
            ZStack{
                Color.gray.opacity(0.2)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .padding()
                HStack{
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.black)
                        .font(.title)
                    Image(systemName: "waveform")
                        .resizable()
                        .frame(width: 200, height: 30)
                        .foregroundStyle(.gray)
                        .font(.title)
                    Text("20:55")
                    Image(systemName: "speaker.wave.3.fill")
                    
                }
            }
                Divider()

                Spacer()
                
                HStack {
                    Text("Your Material")
                        .bold()
                    Spacer()
                    Text("See All")
                        .foregroundStyle(.gray)
                }
                
                .padding(.horizontal)
                
                DesignScrollView()
            }
        }
    }



#Preview{
    MainPage()
}
