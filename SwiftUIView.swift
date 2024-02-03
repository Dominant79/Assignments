import SwiftUI

struct ContentView: View {
    @ObservedObject var courseD = CourseData()
    @State var search: String = ""
    @State var selectedCourse: Course?
    @State var isBookmarkSheetPresented = false

    let categories = ["All", "Analysis", "Design", "Programming"]


    var body: some View {
        ZStack {
                    VStack(spacing: 0) {
                        Color.indigo
                            .opacity(0.9)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

                        VStack {
                            HStack {
                                Text("Categories")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                                Spacer()
                                Button("See All"){}
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 20)
                            }

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(categories, id: \.self) { category in
                                        CategoryBoxView(title: category)
                                    }
                                }
                                .padding(.horizontal, 20)
                            }

                            ForEach(courseD.courses.indices, id: \.self) { index in
                                CategoryBoxView(course: courseD.courses[index], onTap: {
                                    selectedCourse = courseD.courses[index]
                                    isBookmarkSheetPresented.toggle()
                                }, onBookmarkTap: {
                                    selectedCourse = courseD.courses[index]
                                    isBookmarkSheetPresented.toggle()
                                })
                                .padding()
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            }
                        }
                        .padding(.top, 20)

                    }
                    .edgesIgnoringSafeArea(.top)

                    VStack {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.white)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 10)
                                .padding(.bottom, 10)
                        }

                        VStack {
                            Text("Bookmark")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            Text("your saved courses")
                                .foregroundColor(.gray)
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
                        .frame(maxHeight: .infinity, alignment: .topLeading)
                    }
                }
                .sheet(isPresented: $isBookmarkSheetPresented) {
                    BookmarkSheetView(course: selectedCourse, onCancel: {
                        isBookmarkSheetPresented = false
                        selectedCourse = nil
                    }, onAddBookmark: {
                        if let selectedCourse = selectedCourse, let index = courseD.courses.firstIndex(where: { $0.id == selectedCourse.id }) {
                            courseD.courses[index].isBookmarked = true
                        }
                        isBookmarkSheetPresented = false
                        selectedCourse = nil
                    }, onRemoveBookmark: {
                        if let selectedCourse = selectedCourse, let index = courseD.courses.firstIndex(where: { $0.id == selectedCourse.id }) {
                            courseD.courses[index].isBookmarked = false
                        }
                        isBookmarkSheetPresented = false
                        selectedCourse = nil
                    })
                    .presentationDetents([.height(400)])

                }

                }
            }


struct CategoryBoxView: View {
    var course: Course?
    var title: String?
    var onTap: (() -> Void)?
    var onBookmarkTap: (() -> Void)?

    var body: some View {
        VStack {
            if let course = course {
                VStack{
                    HStack{
                        Image(course.imageName)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                        Text(course.title)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                HStack{
                    Spacer()
                    Text(course.time)
                        .foregroundColor(.gray)
                    Image(systemName: "video")
                        .foregroundColor(.gray)
                    Text(course.lessons)
                        .foregroundColor(.gray)
                    Spacer()
                    Button(action: {
                        onBookmarkTap?()
                    }) {
                        Image(systemName: course.isBookmarked ? "bookmark.fill" : "bookmark")
                            .foregroundColor(course.isBookmarked ? .black : .gray)
                    }
                }
                Text(course.price)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
            } else if let title = title {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 3)
        )
        .onTapGesture {
            onTap?()
        }
    }
}





struct BookmarkSheetView: View {
    var course: Course?
    var onCancel: (() -> Void)?
    var onAddBookmark: (() -> Void)?
    var onRemoveBookmark: (() -> Void)?

    var body: some View {
        VStack {
            if let course = course {
                VStack {
                    HStack {
                        Image(course.imageName)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                        Text(course.title)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Spacer()
                        Text(course.time)
                            .foregroundColor(.gray)
                        Image(systemName: "video")
                            .foregroundColor(.gray)
                        Text(course.lessons)
                            .foregroundColor(.gray)
                        Spacer()

                    }
                    Text(course.price)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .padding(.bottom, 20)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 3)
                )
            }

            HStack {
                Button("Cancel") {
                    onCancel?()
                }
                .padding()
                .cornerRadius(10)
                Spacer()
                if let course = course {
                    Button(course.isBookmarked ? "Remove Bookmark" : "Add Bookmark") {
                        if course.isBookmarked {
                            onRemoveBookmark?()
                        } else {
                            onAddBookmark?()
                        }
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(course.isBookmarked ? Color.red : Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}






#Preview{
    ContentView()
}
