import SwiftUI

struct Course: Identifiable, Hashable {
    let id = UUID()
    var imageName: String
    var title: String
    var time: String
    var lessons: String
    var price: String
    var isBookmarked: Bool
}
class CourseData: ObservableObject {
    @Published var search: String = ""
    @Published var courses: [Course] = [
        Course(imageName: "img1", title: "Design thinking fundamental", time: "3h 50min", lessons: "22 lessons", price: "$3,021", isBookmarked: true),
        Course(imageName: "img2", title: "Logo Design", time: "3h 50min", lessons: "22 lessons", price: "$3,021", isBookmarked: true)
    ]
}
