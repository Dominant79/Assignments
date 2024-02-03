import SwiftUI

struct Course2: Identifiable, Hashable {
    let id = UUID()
    var imageName: String
    var title: String
    var time: String
    var lessons: String
    var price: String
    var isBookmarked: Bool
}

struct UX_Design: View {
    @State var search: String = ""
    @State var courses = [
        Course2(imageName: "img1", title: "Design thinking fundamental", time: "3h 50min", lessons: "22 lessons", price: "$3,021", isBookmarked: true),
        Course2(imageName: "img2", title: "Logo Design", time: "3h 50min", lessons: "22 lessons", price: "$3,021", isBookmarked: true)
    ]

    var body: some View {
        VStack {
            ZStack {
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

            ScrollView(.vertical){
                VStack {
                    ForEach(courses + courses) { course in
//                        Divider()
                        
                        VStack {
                            HStack {
                                Image(course.imageName)
                                    .resizable()
                                    .frame(width: 140, height: 100)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                VStack{
                                    Text(course.title)
                                        .padding(.leading)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                        .padding(.vertical, 8)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack {
                                        Spacer()
                                        Text(course.time)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        Image(systemName: "video")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Text(course.lessons)
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                        Spacer()
                                    }

                                }
                            }
                            VStack{
                                Text(course.price)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.subheadline)
                            }
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 3)
                        )
                        .padding()

                    }
                }
            }
        }
    }
}

#Preview{
        UX_Design()
    }

