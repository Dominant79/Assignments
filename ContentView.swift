//import SwiftUI
//
//struct ContentView: View {
//    @State var search: String = ""
//    @State var selectedCourse: Course?
//    @State var isBookmarkSheetPresented = false
//    
//    let categories = ["All", "Analysis", "Design", "Programming"]
//    @State var courses = [
//        Course(id: UUID(), imageName: "img1", title: "Design thinking fundamental", time: "3h 50min", lessons: "22 lessons", price: "$3,021", isBookmarked: false),
//        Course(id: UUID(), imageName: "img2", title: "Logo Design", time: "3h 50min", lessons: "22 lessons", price: "$3,021", isBookmarked: false)
//    ]
//    
//    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                Color.indigo
//                    .opacity(0.9)
//                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)) // Apply corner radius
//                
//                VStack {
//                    HStack {
//                        Text("Categories")
//                            .font(.title)
//                            .foregroundColor(.black)
//                            .padding(.leading, 20)
//                        Spacer()
//                        Button(action: {
//                            // See All action
//                        }) {
//                            Text("See All")
//                                .foregroundColor(.gray)
//                                .padding(.trailing, 20)
//                        }
//                    }
//                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 15) {
//                            ForEach(categories, id: \.self) { category in
//                                CategoryBoxView(title: category)
//                            }
//                        }
//                        .padding(.horizontal, 20)
//                    }
//                    
//                    ForEach(courses.indices, id: \.self) { index in
//                        CategoryBoxView(course: courses[index], onTap: {
//                            selectedCourse = courses[index]
//                            isBookmarkSheetPresented.toggle()
//                        }, onBookmarkTap: {
//                            selectedCourse = courses[index]
//                            isBookmarkSheetPresented.toggle()
//                        })
//                        .padding(.bottom, 20)
//                        .background(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)) // Apply corner radius
//                    }
//                }
//                .padding(.top, 20)
//                
//            }
//            .edgesIgnoringSafeArea(.top) // Ignore top safe area
//            
//            VStack {
//                HStack {
//                    Image(systemName: "chevron.left")
//                        .foregroundStyle(.white)
//                        .font(.title)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.bottom, 10)
//                }
//                
//                VStack {
//                    Text("Bookmark")
//                        .font(.title)
//                        .foregroundColor(.white)
//                    Text("your saved courses")
//                        .foregroundColor(.gray)
//                        .padding(.leading)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                
//                HStack {
//                    TextField("", text: $search)
//                        .overlay(
//                            Text("Search")
//                                .foregroundColor(.gray)
//                                .padding()
//                        )
//                        .overlay(
//                            Image(systemName: "magnifyingglass")
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                        )
//                        .padding(10)
//                        .background(Color.white)
//                        .cornerRadius(8)
//                    
////                    Button(action: {
////                        isBookmarkSheetPresented.toggle()
////                    }) {
//                        Image(systemName: "line.3.horizontal.decrease.circle")
//                            .font(.title)
//                            .foregroundColor(.white)
////                    }
//                }
//                .padding()
//                .frame(maxHeight: .infinity, alignment: .topLeading)
//            }
//        }
//        .sheet(isPresented: $isBookmarkSheetPresented) {
//            BookmarkSheetView(course: selectedCourse, onCancel: {
//                isBookmarkSheetPresented = false
//                selectedCourse = nil
//            }, onAddBookmark: {
//                if let selectedCourse = selectedCourse, let index = courses.firstIndex(where: { $0.id == selectedCourse.id }) {
//                    courses[index].isBookmarked = true
//                }
//                isBookmarkSheetPresented = false
//                selectedCourse = nil
//            }, onRemoveBookmark: {
//                if let selectedCourse = selectedCourse, let index = courses.firstIndex(where: { $0.id == selectedCourse.id }) {
//                    courses[index].isBookmarked = false // Set bookmarked status to false
//                }
//                isBookmarkSheetPresented = false
//                selectedCourse = nil
//            })
//            .presentationDetents([.height(400)])
//
//        }
//
//        }
//    }
//
//
//struct Course: Identifiable, Hashable {
//    let id: UUID
//    var imageName: String
//    var title: String
//    var time: String
//    var lessons: String
//    var price: String
//    var isBookmarked: Bool
//}
//
//struct CategoryBoxView: View {
//    var course: Course?
//    var title: String?
//    var onTap: (() -> Void)?
//    var onBookmarkTap: (() -> Void)?
//    
//    var body: some View {
//        VStack {
//            if let course = course {
//                VStack{
//                    HStack{
//                        Image(course.imageName)
//                            .resizable()
//                            .frame(width: 100, height: 100)
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundColor(.black)
//                        Text(course.title)
//                            .font(.subheadline)
//                            .fontWeight(.bold)
//                            .multilineTextAlignment(.center)
//                            .padding(.vertical, 5)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                    }
//                }
//                HStack{
//                    Spacer()
//                    Text(course.time)
//                        .foregroundColor(.gray)
//                    Image(systemName: "video")
//                        .foregroundColor(.gray)
//                    Text(course.lessons)
//                        .foregroundColor(.gray)
//                    Spacer()
//                    Button(action: {
//                        onBookmarkTap?()
//                    }) {
//                        Image(systemName: course.isBookmarked ? "bookmark.fill" : "bookmark")
//                            .foregroundColor(course.isBookmarked ? .black : .gray) // Change icon color based on bookmark status
//                    }
//                }
//                Text(course.price)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.title3)
//            } else if let title = title {
//                Text(title)
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .multilineTextAlignment(.center)
//                    .padding(.vertical, 5)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(20)
//        .overlay(
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(Color.gray, lineWidth: 3)
//        )
//        .onTapGesture {
//            onTap?()
//        }
//    }
//}
//
//
//
//
//
//struct BookmarkSheetView: View {
//    var course: Course?
//    var onCancel: (() -> Void)?
//    var onAddBookmark: (() -> Void)?
//    var onRemoveBookmark: (() -> Void)? // Add callback for removing bookmark
//    
//    var body: some View {
//        VStack {
//            if let course = course {
//                VStack {
//                    HStack {
//                        Image(course.imageName)
//                            .resizable()
//                            .frame(width: 100, height: 100)
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundColor(.black)
//                        Text(course.title)
//                            .font(.subheadline)
//                            .fontWeight(.bold)
//                            .multilineTextAlignment(.center)
//                            .padding(.vertical, 5)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                    }
//                    HStack {
//                        Spacer()
//                        Text(course.time)
//                            .foregroundColor(.gray)
//                        Image(systemName: "video")
//                            .foregroundColor(.gray)
//                        Text(course.lessons)
//                            .foregroundColor(.gray)
//                        Spacer()
//
//                    }
//                    Text(course.price)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.title3)
//                        .padding(.bottom, 20)
//                }
//                .padding()
//                .background(Color.white)
//                .cornerRadius(20)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.gray, lineWidth: 3)
//                )
//            }
//            
//            HStack {
//                Button("Cancel") {
//                    onCancel?()
//                }
//                .padding()
//                .cornerRadius(10)
//                Spacer()
//                if let course = course {
//                    Button(course.isBookmarked ? "Remove Bookmark" : "Add Bookmark") {
//                        if course.isBookmarked {
//                            onRemoveBookmark?() // Call the remove bookmark action
//                        } else {
//                            onAddBookmark?()
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(course.isBookmarked ? Color.red : Color.blue) // Change color to red for Remove Bookmark
//                    .cornerRadius(10)
//                    .foregroundColor(.white) // Always set foreground color to white
//                }
//            }
//            .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.white)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//
//
//
//
//
//#Preview{
//    ContentView()
//}
