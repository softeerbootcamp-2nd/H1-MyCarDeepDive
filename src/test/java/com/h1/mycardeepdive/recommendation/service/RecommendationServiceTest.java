package com.h1.mycardeepdive.recommendation.service;

import static com.h1.mycardeepdive.fixture.CustomRecommendationFixture.createCustomRecommendation;
import static com.h1.mycardeepdive.fixture.RecommendationFixture.createRecommendation;
import static com.h1.mycardeepdive.recommendation.mapper.RecommendationMapper.toRecommendationResponse;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.mockito.Mockito.when;

import com.h1.mycardeepdive.recommendation.domain.CustomRecommendation;
import com.h1.mycardeepdive.recommendation.domain.Recommendation;
import com.h1.mycardeepdive.recommendation.domain.repository.CustomRecommendationRepository;
import com.h1.mycardeepdive.recommendation.domain.repository.RecommendationRepository;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationResponse;
import java.util.Optional;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class RecommendationServiceTest {
    @Mock private RecommendationRepository recommendationRepository;
    @Mock private CustomRecommendationRepository customRecommendationRepository;

    @InjectMocks private RecommendationService recommendationService;

    @Test
    @DisplayName("ageGroupId, lifeStyleId가 주어졌을 때 RecommendationCar를 찾을 수 있는 지 확인한다.")
    void findRecommendation() {
        // given
        long ageGroupId = 1L;
        long lifeStyleId = 1L;

        Recommendation recommendation = createRecommendation(ageGroupId, lifeStyleId);
        RecommendationResponse recommendationResponse1 =
                toRecommendationResponse(recommendation.getRecommendationCar());
        when(recommendationRepository.findByAgeGroupIdAndLifeStyleId(ageGroupId, lifeStyleId))
                .thenReturn(Optional.of(recommendation));
        // when
        RecommendationResponse recommendationResponse2 =
                recommendationService.findRecommendation(ageGroupId, lifeStyleId);
        // then
        assertThat(recommendationResponse2.getTrim_name())
                .isEqualTo(recommendationResponse1.getTrim_name());
        assertThat(recommendationResponse2.getCar_img_url())
                .isEqualTo(recommendationResponse1.getCar_img_url());
        assertThat(recommendationResponse2.getComment1())
                .isEqualTo(recommendationResponse1.getComment1());
        assertThat(recommendationResponse2.getComment2())
                .isEqualTo(recommendationResponse1.getComment2());
        assertThat(recommendationResponse2.getKeyword())
                .isEqualTo(recommendationResponse1.getKeyword());
        assertThat(recommendationResponse2.getEngine_name())
                .isEqualTo(recommendationResponse1.getEngine_name());
        assertThat(recommendationResponse2.getDriving_system_name())
                .isEqualTo(recommendationResponse1.getDriving_system_name());
        assertThat(recommendationResponse2.getBody_name())
                .isEqualTo(recommendationResponse1.getBody_name());
        assertThat(recommendationResponse2.getCar_spec_id())
                .isEqualTo(recommendationResponse1.getCar_spec_id());
        assertThat(recommendationResponse2.getTrim_id())
                .isEqualTo(recommendationResponse1.getTrim_id());
        assertThat(recommendationResponse2.getExterior_color_id())
                .isEqualTo(recommendationResponse1.getExterior_color_id());
        assertThat(recommendationResponse2.getExterior_color_name())
                .isEqualTo(recommendationResponse1.getExterior_color_name());
        assertThat(recommendationResponse2.getExterior_color_price())
                .isEqualTo(recommendationResponse1.getExterior_color_price());
        assertThat(recommendationResponse2.getExterior_color_comment())
                .isEqualTo(recommendationResponse1.getExterior_color_comment());
        assertThat(recommendationResponse2.getExterior_color_icon_url())
                .isEqualTo(recommendationResponse1.getExterior_color_icon_url());
        assertThat(recommendationResponse2.getInterior_color_id())
                .isEqualTo(recommendationResponse1.getInterior_color_id());
        assertThat(recommendationResponse2.getInterior_color_name())
                .isEqualTo(recommendationResponse1.getInterior_color_name());
        assertThat(recommendationResponse2.getInterior_color_price())
                .isEqualTo(recommendationResponse1.getInterior_color_price());
        assertThat(recommendationResponse2.getInterior_color_comment())
                .isEqualTo(recommendationResponse1.getInterior_color_comment());
        assertThat(recommendationResponse2.getInterior_color_icon_url())
                .isEqualTo(recommendationResponse1.getInterior_color_icon_url());
        assertThat(recommendationResponse2.getOptions().size())
                .isEqualTo(recommendationResponse1.getOptions().size());
        assertThat(recommendationResponse2.getPackages().size())
                .isEqualTo(recommendationResponse1.getPackages().size());
        assertThat(recommendationResponse2.getTotalPrice())
                .isEqualTo(recommendationResponse1.getTotalPrice());
    }

    @Test
    @DisplayName(
            "drivingExperienceId, familyMembersId, carPurposeId, personalValueId가 주어졌을 때 RecommendationCar를 찾을 수 있는 지 확인한다.")
    void findCustomRecommendation() {
        // given
        long drivingExperienceId = 1L;
        long familyMembersId = 1L;
        long carPurposeId = 1L;
        long personalValueId = 1L;
        CustomRecommendation customRecommendation =
                createCustomRecommendation(
                        drivingExperienceId, familyMembersId, carPurposeId, personalValueId);
        RecommendationResponse recommendationResponse1 =
                toRecommendationResponse(customRecommendation.getRecommendationCar());
        when(customRecommendationRepository
                        .findByDrivingExperienceIdAndFamilyMembersIdAndCarPurposeIdAndPersonalValueId(
                                drivingExperienceId,
                                familyMembersId,
                                carPurposeId,
                                personalValueId))
                .thenReturn(customRecommendation);
        // when
        RecommendationResponse recommendationResponse2 =
                recommendationService.findCustomRecommendation(
                        drivingExperienceId, familyMembersId, carPurposeId, personalValueId);

        // then
        assertThat(recommendationResponse2.getTrim_name())
                .isEqualTo(recommendationResponse1.getTrim_name());
        assertThat(recommendationResponse2.getCar_img_url())
                .isEqualTo(recommendationResponse1.getCar_img_url());
        assertThat(recommendationResponse2.getComment1())
                .isEqualTo(recommendationResponse1.getComment1());
        assertThat(recommendationResponse2.getComment2())
                .isEqualTo(recommendationResponse1.getComment2());
        assertThat(recommendationResponse2.getKeyword())
                .isEqualTo(recommendationResponse1.getKeyword());
        assertThat(recommendationResponse2.getEngine_name())
                .isEqualTo(recommendationResponse1.getEngine_name());
        assertThat(recommendationResponse2.getDriving_system_name())
                .isEqualTo(recommendationResponse1.getDriving_system_name());
        assertThat(recommendationResponse2.getBody_name())
                .isEqualTo(recommendationResponse1.getBody_name());
        assertThat(recommendationResponse2.getCar_spec_id())
                .isEqualTo(recommendationResponse1.getCar_spec_id());
        assertThat(recommendationResponse2.getTrim_id())
                .isEqualTo(recommendationResponse1.getTrim_id());
        assertThat(recommendationResponse2.getExterior_color_id())
                .isEqualTo(recommendationResponse1.getExterior_color_id());
        assertThat(recommendationResponse2.getExterior_color_name())
                .isEqualTo(recommendationResponse1.getExterior_color_name());
        assertThat(recommendationResponse2.getExterior_color_price())
                .isEqualTo(recommendationResponse1.getExterior_color_price());
        assertThat(recommendationResponse2.getExterior_color_comment())
                .isEqualTo(recommendationResponse1.getExterior_color_comment());
        assertThat(recommendationResponse2.getExterior_color_icon_url())
                .isEqualTo(recommendationResponse1.getExterior_color_icon_url());
        assertThat(recommendationResponse2.getInterior_color_id())
                .isEqualTo(recommendationResponse1.getInterior_color_id());
        assertThat(recommendationResponse2.getInterior_color_name())
                .isEqualTo(recommendationResponse1.getInterior_color_name());
        assertThat(recommendationResponse2.getInterior_color_price())
                .isEqualTo(recommendationResponse1.getInterior_color_price());
        assertThat(recommendationResponse2.getInterior_color_comment())
                .isEqualTo(recommendationResponse1.getInterior_color_comment());
        assertThat(recommendationResponse2.getInterior_color_icon_url())
                .isEqualTo(recommendationResponse1.getInterior_color_icon_url());
        assertThat(recommendationResponse2.getOptions().size())
                .isEqualTo(recommendationResponse1.getOptions().size());
        assertThat(recommendationResponse2.getPackages().size())
                .isEqualTo(recommendationResponse1.getPackages().size());
        assertThat(recommendationResponse2.getTotalPrice())
                .isEqualTo(recommendationResponse1.getTotalPrice());
    }
}
