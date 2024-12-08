//
//  Core+Extensions.swift
//  Weather App
//
//  Created by Davi Paiva on 07/12/24.
//

import Foundation

extension Int {
    func toWeekDayName() ->String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE" // "EEEE" represents the full weekday name
        
        return dateFormatter.string(from: date)
    }
    
    func toHourFormat() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // "HH:mm" represent the 24-hour format
        
        return dateFormatter.string(from: date)
    }
    
    func isDayTime() -> Bool{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let hour = Calendar.current.component(.hour, from: date)
        
        let dayStartHour = 6
        let dayEndHour = 18
        
        return hour >= dayStartHour && hour < dayEndHour
        
    }
}

extension Double {
    func toCelsius() -> String{
        "\(Int(self))°C"
    }
}
