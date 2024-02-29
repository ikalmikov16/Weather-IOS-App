//
//  ContentView.swift
//  Weather
//
//  Created by Irakli Kalmikov on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                
                //--------------
                Button(action: {
                    //swift code
                    
                } , label: {
                    NavigationLink(destination: WeatherCityView(cityCode: "KBOS")) {
                            Text("BOSTON")
                            .padding()
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    }
                }) // end button
                
                //-----------
                Button(action: {
                    // swift code
                } , label: {
                    NavigationLink(destination: WeatherCityView(cityCode: "KNYC")) {
                            Text("NEW YORK CITY")
                            .padding()
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    }
                }) // end button
                
                //----------
                Button(action: {
                    // swift code

                } , label: {
                    NavigationLink(destination: WeatherCityView(cityCode: "KMIA")) {
                            Text("MIAMI")
                            .padding()
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    }
                }) // end button
                
                //----------
                Button(action: {
                    // swift code

                } , label: {
                    NavigationLink(destination: WeatherCityView(cityCode: "KDAL")) {
                            Text("DALLAS")
                            .padding()
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    }
                }) // end button
                
                //----------
                Button(action: {
                    // swift code

                } , label: {
                    NavigationLink(destination: WeatherCityView(cityCode: "KDEN")) {
                            Text("DENVER")
                            .padding()
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    }
                }) // end button
                
                //----------
                Button(action: {
                    // swift code

                } , label: {
                    NavigationLink(destination: WeatherCityView(cityCode: "KLAX")) {
                        Text("LOS ANGELES")
                            .padding()
                            .foregroundColor(Color.blue)
                            .font(.largeTitle)
                    }
                }) // end button
                
               //----------
               Button(action: {
                   // swift code

               } , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KSEA")) {
                           Text("SEATTLE")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               }) // end button
               
               //----------
               Button(action: {
                   // swift code

               } , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KDET")) {
                       Text("DETROIT")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               }) // end button
                                   
                
            }//end Vstack
            
            .navigationTitle("Weather")
        }// end navigationview
    }// end body
}//end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
