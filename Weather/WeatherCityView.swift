//
//  WeatherCityView.swift
//  Weather
//
//  Created by Irakli Kalmikov on 10/13/22.
//

import SwiftUI

struct WeatherCityView: View {
    
    @State var cityCode:String
    @State private var title:String = ""
    @State private var cityPicture:String = ""
    @State private var xmlWeatherTagData: String = ""
    @State private var weatherPicture:String = ""
    @State private var xmlData:String = ""
    @State private var location:String = ""
    @State private var tempF:String = ""
    @State private var tempC: String = ""
    @State private var station:String = ""
    @State private var visibility:String = ""
    @State private var dewpointF:String = ""
    @State private var dewpointC:String = ""
    
    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.medium)
            
            Image(cityPicture)
                .resizable()
      
            //Text(xmlWeatherTagData)
            Image(weatherPicture)
                .resizable()
            
            Text("Today's Weather: \(weatherPicture)")
            Text("Temperature: \(tempF)F (\(tempC)C)")
            Text("Station: \(station)")
            Text("Visibility: \(visibility)mi")
            Text("Dewpoint: \(dewpointF)F (\(dewpointC)C)")
            
            /*Text(xmlData)
                .font(.system(size: 10))*/
            
        }
        .task {
            await fetchWeatherData(cityCode: cityCode)
        }
    } // end body
    
    func fetchWeatherData(cityCode: String) async {
        // create the URL
        
        let urlString = "http://w1.weather.gov/xml/current_obs/" + cityCode + ".xml"
        
        guard let url = URL(string: urlString)
        else {
            print("Hey Man, THIS URL DOES NOT WORK!")
            return
        }
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                //
                // variables to use
                //
                var tempString     = ""
                var weatherTagData = ""
            
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    
                    //
                    // get the <weather> tag data
                    //
                    var tokens = dataString.components(separatedBy: "weather>")
                    var arraySize = tokens.count
                    if arraySize >= 2 {
                        
                        var counter = 1
                        for xmlWeatherLine in tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            
                            counter = counter + 1
                        }
                        
                        weatherTagData = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    // get the <location> tag data
                    tokens = dataString.components(separatedBy: "location>")
                    arraySize = tokens.count
                    if arraySize >= 2 {
                        
                        var counter = 1
                        for xmlWeatherLine in tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            
                            counter = counter + 1
                        }
                        
                        location = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    // get the <temp_f> tag data
                    tokens = dataString.components(separatedBy: "temp_f>")
                    arraySize = tokens.count
                    if arraySize >= 2 {
                        
                        var counter = 1
                        for xmlWeatherLine in tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            
                            counter = counter + 1
                        }
                        
                        tempF = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    // get the <temp_c> tag data
                    tokens = dataString.components(separatedBy: "temp_c>")
                    arraySize = tokens.count
                    if arraySize >= 2 {
                        
                        var counter = 1
                        for xmlWeatherLine in tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            
                            counter = counter + 1
                        }
                        
                        tempC = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    // get the <station> tag data
                    tokens = dataString.components(separatedBy: "station_id>")
                    arraySize = tokens.count
                    if arraySize >= 2 {
                        
                        var counter = 1
                        for xmlWeatherLine in tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            
                            counter = counter + 1
                        }
                        
                        station = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    // get the <visibility_mi> tag data
                    tokens = dataString.components(separatedBy: "visibility_mi>")
                    arraySize = tokens.count
                    if arraySize >= 2 {
                        
                        var counter = 1
                        for xmlWeatherLine in tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            
                            counter = counter + 1
                        }
                        
                        visibility = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    // get the <dewpoint_f> tag data
                    tokens = dataString.components(separatedBy: "dewpoint_f>")
                    arraySize = tokens.count
                    if arraySize >= 2 {
                        
                        var counter = 1
                        for xmlWeatherLine in tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            
                            counter = counter + 1
                        }
                        
                        dewpointF = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    // get the <dewpoint_c> tag data
                    tokens = dataString.components(separatedBy: "dewpoint_c>")
                    arraySize = tokens.count
                    if arraySize >= 2 {
                        
                        var counter = 1
                        for xmlWeatherLine in tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            
                            counter = counter + 1
                        }
                        
                        dewpointC = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    if cityCode == "KBOS" {
                        title = "BOSTON SKYLINE"
                        cityPicture = "Boston"
                        xmlWeatherTagData = weatherTagData
                        weatherPicture = "Rain"
                        xmlData = dataString
                    }
                    else if cityCode == "KNYC" {
                        title = "NEW YORK CITY SKYLINE"
                        cityPicture = "nyc"
                        xmlWeatherTagData = weatherTagData
                        weatherPicture = "Overcast"
                        xmlData = dataString
                    }
                    else if cityCode == "KMIA" {
                        title = "MIAMI SKYLINE"
                        cityPicture = "Miami"
                        xmlWeatherTagData = weatherTagData
                        weatherPicture = "Sunny"
                        xmlData = dataString
                    }
                    else if cityCode == "KDAL" {
                        title = "DALLAS SKYLINE"
                        cityPicture = "Dallas"
                        xmlWeatherTagData = weatherTagData
                        weatherPicture = weatherTagData
                        xmlData = dataString
                    }
                    else if cityCode == "KDEN" {
                        title = "DENVER SKYLINE"
                        cityPicture = "Denver"
                        xmlWeatherTagData = weatherTagData
                        weatherPicture = weatherTagData
                        xmlData = dataString
                    }
                    else if cityCode == "KLAX" {
                        title = "LOS ANGELES SKYLINE"
                        cityPicture = "LA"
                        xmlWeatherTagData = weatherTagData
                        weatherPicture = weatherTagData
                        xmlData = dataString
                    }
                    else if cityCode == "KSEA" {
                        title = "SEATTLE SKYLINE"
                        cityPicture = "Seattle"
                        xmlWeatherTagData = weatherTagData
                        weatherPicture = weatherTagData
                        xmlData = dataString
                    }
                    else if cityCode == "KDET" {
                        title = "DETROIT SKYLINE"
                        cityPicture = "Detroit"
                        xmlWeatherTagData = weatherTagData
                        weatherPicture = weatherTagData
                        xmlData = dataString
                    }

                    
                } // end let data
                    
        }
        task.resume()
        
    } // end function
}

struct WeatherCityView_Previews: PreviewProvider {
    
    @State static var cityCode: String = ""
    
    static var previews: some View {
        WeatherCityView(cityCode: cityCode)
    }
}
