import SwiftUI

// TODO: probably create a text struct and reuse
// TODO: Some texts are hardcoded need to refactor (api calls)
// TODO: need to fix category button text color
// TODO: need some code cleaning

struct HomePage: View {
    var body: some View {
        VStack(spacing: 1) {
            Greeting()
            Featured()
            Category()
            Recipe()
            Spacer()
        }
        .padding(.leading,5)
        .padding(.top,10)
    }
}

struct Greeting: View {
    var body: some View {
        VStack (spacing:2){
            HStack {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color("Primary"))
                
                Text("Good Morning")
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "cart")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .padding(.trailing,6)
            }
            .padding(.horizontal)
            
            Text("Aleena Sabyan")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
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
                HStack(spacing: 10) {
                    ForEach(FeaturedData.items) { item in
                        item.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 264, height: 172)
                            .cornerRadius(16)
                            .overlay {
                                VStack {
                                    Spacer()
                                    Text(item.title)
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 30)
                                    
                                    HStack {
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
                                    .padding(.bottom, 15)
                                    .padding(.horizontal, 30)
                                    .padding(.top, 10)
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
                HStack(spacing: 10) {
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
                    }
                }
                .padding()
            }
        }
    }
}

struct Recipe: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Popular Recipes")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .top, .leading])
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(RecipeData.items) { item in
                        Rectangle()
                            .frame(width: 200, height: 240)
                            .cornerRadius(16)
                            .foregroundColor(.white)
                            .shadow(color:Color.black.opacity(0.1),radius:5)
                            .scaledToFit()
                            .overlay {
                                VStack (spacing:4){
                                    item.image
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(25)
                                        .frame(width: 168, height: 128)
                                        .padding(.top,5)
                                    
                                    Text(item.title)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 15)
                                        .padding(.top, 5)
                                    
                                    
                                    HStack {
                                        Image(systemName: "flame")
                                            .foregroundColor(.black)
                                        Text(item.calorie)
                                            .font(.system(size: 14, weight: .regular))
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "clock")
                                            .foregroundColor(.black)
                                        Text("\(item.time) min")
                                            .font(.system(size: 14, weight: .thin))
                                            .foregroundColor(.black)
                                    }
                                    .padding(.bottom, 15)
                                    .padding(.horizontal, 15)
                                    .padding(.top, 5)
                                }
                            }
                    }
                }
                .padding()
            }
        }
    }
}




struct BottomNavBar: View {
    @State private var selectedTab: Int = 2 // Default selected tab
    private let tabItems = ["house.fill", "magnifyingglass", "bell.fill", "person.fill"]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                // Bottom Navigation Bar
                HStack {
                    ForEach(0..<tabItems.count, id: \.self) { index in
                        if index == 2 { // Skip the middle tab for the elevated button
                            Spacer()
                        } else {
                            Image(systemName: tabItems[index])
                                .font(.system(size: 24))
                                .foregroundColor(index == selectedTab ? .blue : .gray)
                                .onTapGesture {
                                    withAnimation {
                                        selectedTab = index
                                    }
                                }
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 30)
                .background(
                    Color.white
                        .clipShape(CustomTabBarShape())
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
                )
                .overlay(
                    // Elevated Button
                    Button(action: {
                        withAnimation {
                            selectedTab = 2
                        }
                    }) {
                        Image(systemName: "crown.fill") // Change icon as needed
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.green)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    }
                        .offset(y: -30), // Elevate button above the nav bar
                    alignment: .top
                )
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

// Custom shape for the bottom navigation bar with a cutout for the elevated button
struct CustomTabBarShape: Shape {
    func path(in rect: CGRect) -> Path {
        let circleRadius: CGFloat = 35
        let circleX: CGFloat = rect.width / 2
        let circleY: CGFloat = -circleRadius + 20
        
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: 20, height: 20))
        
        // Cutout circle for elevated button
        path.addArc(center: CGPoint(x: circleX, y: circleY),
                    radius: circleRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 360),
                    clockwise: true)
        
        return path
    }
}
struct FeatureItem: Identifiable {
    let id = UUID()
    let image: Image
    let title: String
    let prof_img: Image
    let user_name: String
    let time: String
}

struct RecipeItems: Identifiable {
    let id = UUID()
    let image: Image
    let title: String
    let calorie: String
    let time: String
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
                    prof_img: Image(systemName: "person.crop.circle.fill"),
                    user_name: "James Spader",
                    time: "10"),
        FeatureItem(image: Image("featured_img"),
                    title: "Healthy Taco Salad with fresh vegetable",
                    prof_img: Image(systemName: "person.crop.circle.fill"),
                    user_name: "James Spader",
                    time: "10"),
        FeatureItem(image: Image("featured_img"),
                    title: "Asian white noodle with extra seafood",
                    prof_img: Image(systemName: "person.crop.circle.fill"),
                    user_name: "James Spader",
                    time: "10")
    ]
}

struct RecipeData {
    static var items = [
        RecipeItems(image: Image("food"),
                    title: "Asian white noodle with extra seafood",
                    calorie: "120",
                    time: "10"),
        RecipeItems(image: Image("food"),
                    title: "Asian white noodle with extra seafood",
                    calorie: "120",
                    time: "10"),
        RecipeItems(image: Image("food"),
                    title: "Asian white noodle with extra seafood",
                    calorie: "120",
                    time: "10"),
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
