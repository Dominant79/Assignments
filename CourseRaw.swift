import SwiftUI

struct CourseRow: View {
    @ObservedObject var courseD = CourseData()

    var body: some View {
        ScrollView(.vertical){
            VStack {
                ForEach(courseD.courses + courseD.courses) { course in
                    VStack {
                        HStack {
                            Image(course.imageName)
                                .resizable()
                                .frame(width: 140, height: 100)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(course.title)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                
                                HStack(spacing: 8) {
                                    Image(systemName: "video")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Text(course.time)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    
                                    Text(course.lessons)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                                Text(course.price)
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                            }
                            .padding(.trailing)
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
