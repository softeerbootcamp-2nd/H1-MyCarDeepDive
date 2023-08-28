//
//  CustomRecomendationModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/23.
//

struct CustomRecomendationModel {
    let drivingExperienceId: Int
    let familyMembersId: Int
    let carPurposeId: Int
    let personalValueId: Int
    let maxBudget: Int
    
    func toDTO() -> CustomRecomendation {
        CustomRecomendation(
            drivingExperienceId: drivingExperienceId,
            familyMembersId: familyMembersId,
            carPurposeId: carPurposeId,
            personalValueId: personalValueId,
            maxBudget: maxBudget)
    }
}
