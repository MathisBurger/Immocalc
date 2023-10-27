//
//  LocationDataList.swift
//  Immocalc
//
//  Created by Mathis Burger on 25.10.23.
//

import SwiftUI

struct LocationDataList: View {
    var object: SearchObject
    
    var body: some View {
        VStack(alignment: .center) {
            if (object.originalAddress != nil && object.originalAddress?.locationQuery != nil) {
                TextWithTitle(text: (object.originalAddress!).locationQuery!, title: "Adresse")
            }
            Spacer()
            HStack(alignment: .center, spacing: 40) {
                TextWithTitle(text: String(object.locationFactor.population), title: "Bevölkerung")
                TextWithTitle(text: String(object.locationFactor.populationTrend.from)+"% bis " + String(object.locationFactor.populationTrend.to)+"%", title: "Bevölkerungstrend")
                TextWithTitle(text: String(object.locationFactor.score), title: "Ranking")
            }
            Spacer()
            HStack(alignment: .center, spacing: 20) {
                TextWithTitle(text: String(object.locationFactor.unemploymentRate)+"%", title: "Arbeitslosenrate")
                BooleanWithTitle(status: object.locationFactor.hasUniversity, title: "Universität")
                TextWithTitle(text: object.locationFactor.universityScore != nil ? String(object.locationFactor.universityScore!) : "-/-", title: "Universitäts-Score")
                TextWithTitle(text: object.locationFactor.numberOfStudents != nil ? String(object.locationFactor.numberOfStudents!) : "-/-", title: "Anzahl der Studenten")
            }
        }
    }
}
