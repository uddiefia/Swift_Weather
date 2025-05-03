import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityTextView(cityName: "Kandy, LK")
                MainWeatherStatusView(temperature: 70, imageName:isNight ? "moon.stars.fill": "cloud.sun.fill")
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName:isNight ? "cloud.moon.fill":"cloud.sun.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "WED", imageName:isNight ?"moon.fill":"sun.max.fill", temperature: 40)
                    WeatherDayView(dayOfWeek: "THU", imageName:isNight ? "cloud.moon.rain.fill":"cloud.rain.fill", temperature: 25)
                    WeatherDayView(dayOfWeek: "FRI", imageName:isNight ? "cloud.moon.bolt.fill":"cloud.bolt.fill", temperature: 27)
                    WeatherDayView(dayOfWeek: "SAT", imageName:"smoke.fill", temperature: 30)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: isNight ? .black :Color.red, backgroundColor:Color.white )
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            
            Text(dayOfWeek).font(.system(size: 16, weight: .medium, design: .default)).foregroundStyle(.white)
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size:28,weight:.medium)).foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black :.blue, isNight ? .gray : Color.red]), startPoint:.topLeading, endPoint:.bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName:String
    
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundStyle(.white).padding()
    }
}

struct MainWeatherStatusView: View {
    
    var temperature:Int
    var imageName: String
    
    var body: some View {
        VStack(spacing: 0){
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size:70,weight:.medium)).foregroundColor(.white)
        }
        
        .padding(.bottom,40)
        
    }
}
