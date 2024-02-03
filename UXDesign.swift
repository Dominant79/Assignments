import SwiftUI



struct UXDesign: View {
    @State var search: String = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Color.indigo
                    .opacity(0.9)
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                
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
                        Text("UI/UX Design")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.leading)
                        Text("Find your courses")
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
            .ignoresSafeArea()
                CourseRow()
        }
    }
}

#Preview{
    UXDesign()
    }
