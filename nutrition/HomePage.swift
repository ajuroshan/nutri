import SwiftUI



// TODO: I should probably create a text struct and reuse

struct HomePage: View {
    var body: some View {
        Greeting()
    }
}

struct Greeting: View {
    var body: some View {
        ZStack {
            VStack(spacing: 3) {
                HStack {
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 24))
                        .foregroundColor(Color("Primary"))
                    
                    Text("Good Morning")
                        .foregroundColor(.primary)
                        .font(.system(size: 14))
                    
                    Spacer()
                    
                    Image(systemName: "cart")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding(.trailing)
                }
                .padding(.horizontal)
                
                Text("Aleena Sabyan")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .leading])
                
                Featured()
                Category()
                Spacer()
            }
        }
    }
}

struct Featured: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Featured")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .top, .leading])
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {                    ForEach(FeaturedData.items) { item in
                    item.image
                        .resizable()
                        .frame(width: 264, height: 172)
                        .cornerRadius(16)
                        .padding(.leading)
                        .scaledToFit()
                        .overlay {
                            VStack (spacing:0){
                                Spacer()
                                Text(item.title)
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading,30)
                                HStack{
                                    item.prof_img
                                        .foregroundColor(.white)
                                    
                                    Text(item.user_name)
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "clock")
                                        .foregroundColor(.white)
                                    Text("\(item.time) min")
                                        .font(.system(size: 14, weight: .thin))
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom,15)
                                .padding(.horizontal,30)
                                .padding(.top,10)
                                
                            }
                        }
                }
                }
                .padding()
            }
        }
    }
}

struct Category: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Category")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .top, .leading])
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) { // Adjusted spacing
                    ForEach(CategoryData.items) { item in
                        Rectangle()
                            .frame(width: 119, height: 41)
                            .cornerRadius(40)
                            .foregroundColor(item.color)
                            .overlay(
                                Text(item.name)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            )
                            .padding(.leading)
                    }
                }
                .padding()
            }
        }
    }
}

struct FeatureItem: Identifiable {
    let id = UUID()
    let image: Image
    let title: String
    let prof_img : Image
    let user_name : String
    let time : String
}

struct CategoryItem: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct FeaturedData {
    static var items = [
        FeatureItem(image: Image("featured_img"),
                    title: "Asian white noodle with extra seafood",
                    prof_img:Image(systemName:"person.crop.circle.fill"),
                    user_name: "James Spader",
                    time:"10"),
        FeatureItem(image: Image("featured_img"),
                    title: "Asian white noodle with extra seafood",
                    prof_img: Image(systemName:"person.crop.circle.fill"),
                    user_name: "James Spader",
                    time:"10"),
        FeatureItem(image: Image("featured_img"),
                    title: "Asian white noodle with extra seafood",
                    prof_img:Image(systemName:"person.crop.circle.fill"),
                    user_name: "James Spader",
                    time:"10")
    ]
}

struct CategoryData {
    static var items = [
        CategoryItem(name: "Breakfast", color: Color("Primary")),
        CategoryItem(name: "Lunch", color: Color("Secondary")),
        CategoryItem(name: "Dinner", color: Color("Secondary"))
    ]
}

#Preview {
    HomePage()
}


