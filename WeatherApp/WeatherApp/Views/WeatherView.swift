//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Manraj Singh on 16/07/23.
//

import SwiftUI

struct WeatherView: View {
    var weather:ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150,alignment: .leading)
                       Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string:/*"https://img.freepik.com/free-vector/street-miami-with-hotels-palm-trees_107791-2509.jpg?w=1380&t=st=1689515032~exp=1689515632~hmac=b203c2c20e621f577feedb267e5f1c4601331cba89b899a0fa5526ed4ce2ed18"))*/
                                            "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) {
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: weather.main.tempMin.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: weather.main.feelsLike.roundDouble()  + "°")
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft,.topRight])
                
            }
            
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
