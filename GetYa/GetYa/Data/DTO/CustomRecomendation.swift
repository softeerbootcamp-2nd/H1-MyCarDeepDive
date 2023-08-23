//
//  CustomRecomendation.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct CustomRecomendation: Encodable {
    let drivingExperienceId: Int
    let familyMembersId: Int
    let carPurposeId: Int
    let personalValueId: Int
    let maxBudget: Int
    
    func toDTO(
        _ customRecommendationModel: CustomRecomendationModel
    ) -> CustomRecomendation {
        CustomRecomendation(
            drivingExperienceId: customRecommendationModel.drivingExperienceId,
            familyMembersId: customRecommendationModel.familyMembersId,
            carPurposeId: customRecommendationModel.carPurposeId,
            personalValueId: customRecommendationModel.personalValueId,
            maxBudget: customRecommendationModel.maxBudget)
    }
}
