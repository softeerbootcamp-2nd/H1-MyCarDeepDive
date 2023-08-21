package com.h1.mycardeepdive.recommendation.ui;

import static com.epages.restdocs.apispec.ResourceDocumentation.parameterWithName;
import static com.epages.restdocs.apispec.ResourceDocumentation.resource;
import static com.h1.mycardeepdive.fixture.CustomRecommendationFixture.createCustomRecommendation;
import static com.h1.mycardeepdive.fixture.RecommendationFixture.createRecommendation;
import static com.h1.mycardeepdive.recommendation.mapper.RecommendationMapper.toRecommendationResponse;
import static org.mockito.Mockito.when;
import static org.springframework.restdocs.operation.preprocess.Preprocessors.*;

import com.epages.restdocs.apispec.MockMvcRestDocumentationWrapper;
import com.epages.restdocs.apispec.ResourceSnippetParameters;
import com.h1.mycardeepdive.ControllerTestConfig;
import com.h1.mycardeepdive.recommendation.domain.CustomRecommendation;
import com.h1.mycardeepdive.recommendation.domain.Recommendation;
import com.h1.mycardeepdive.recommendation.service.RecommendationService;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationResponse;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.restdocs.mockmvc.RestDocumentationRequestBuilders;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

@WebMvcTest(RecommendationController.class)
class RecommendationControllerTest extends ControllerTestConfig {
    private static final String DEFAULT_URL = "/api/v1/car-recommendation";

    @MockBean private RecommendationService recommendationService;

    @Test
    @DisplayName("나이 그룹id와 라이프스타일id가 주어질 때 추천을 반환한다.")
    void getRecommendation() throws Exception {
        // given
        long ageGroupId = 1L;
        long lifeStyleId = 1L;

        MultiValueMap<String, String> info = new LinkedMultiValueMap<>();
        info.add("ageGroupId", String.valueOf(ageGroupId));
        info.add("lifeStyleId", String.valueOf(lifeStyleId));

        Recommendation recommendation = createRecommendation(ageGroupId, lifeStyleId);
        RecommendationResponse recommendationResponse =
                toRecommendationResponse(recommendation.getRecommendationCar());

        when(recommendationService.findRecommendation(ageGroupId, lifeStyleId))
                .thenReturn(recommendationResponse);
        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(DEFAULT_URL)
                                        .params(info)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "recommendation-docs",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("추천")
                                                        .description("나이, 라이프스타일로 추천")
                                                        .requestFields()
                                                        .requestParameters(
                                                                parameterWithName("ageGroupId")
                                                                        .description("1~4"),
                                                                parameterWithName("lifeStyleId")
                                                                        .description("1~4"))
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    @DisplayName("운전경험id와 가족구성원id, 목적id, 가치id, 최대예산이 주어질 때 추천을 반환한다.")
    void getCustomRecommendation() throws Exception {
        // given
        long drivingExperienceId = 1L;
        long familyMembersId = 1L;
        long carPurposeId = 1L;
        long personalValueId = 1L;
        long maxBudget = 69000000L;

        MultiValueMap<String, String> info = new LinkedMultiValueMap<>();
        info.add("drivingExperienceId", String.valueOf(drivingExperienceId));
        info.add("familyMembersId", String.valueOf(familyMembersId));
        info.add("carPurposeId", String.valueOf(carPurposeId));
        info.add("personalValueId", String.valueOf(personalValueId));
        info.add("maxBudget", String.valueOf(maxBudget));

        CustomRecommendation customRecommendation =
                createCustomRecommendation(
                        drivingExperienceId, familyMembersId, carPurposeId, personalValueId);
        RecommendationResponse recommendationResponse =
                toRecommendationResponse(customRecommendation.getRecommendationCar());

        when(recommendationService.findCustomRecommendation(
                        drivingExperienceId, familyMembersId, carPurposeId, personalValueId))
                .thenReturn(recommendationResponse);
        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(DEFAULT_URL + "/custom")
                                        .params(info)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "custom-recommendation-docs",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("추천")
                                                        .description("커스텀 질문지 기반 추천")
                                                        .requestFields()
                                                        .requestParameters(
                                                                parameterWithName(
                                                                                "drivingExperienceId")
                                                                        .description("1~3"),
                                                                parameterWithName("familyMembersId")
                                                                        .description("1~4"),
                                                                parameterWithName("carPurposeId")
                                                                        .description("1~4"),
                                                                parameterWithName("personalValueId")
                                                                        .description("1~4"),
                                                                parameterWithName("maxBudget")
                                                                        .description("최대 예산"))
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }
}
