package com.h1.mycardeepdive.pdf.domain;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.pdf.ui.dto.SimpleOption;
import java.time.LocalDateTime;
import java.util.*;
import org.assertj.core.api.AssertionsForClassTypes;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class PdfInfoTest {

    @DisplayName("PdfInfo 객체를 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createPdfInfo() {
        // given
        String id = "1";
        String carImageUrl = "car.jpg";
        String carName = "My Car";
        String engineName = "engine";
        String trimName = "trimName";
        String bodyName = "body";
        String drivingSystem = "4WD";
        Long basicPrice = 1000000L;
        String maxPower = "mPower";
        String maxTorque = "mTorque";
        String exterior_color_name = "name";
        String exterior_color_img_url = "name";
        long exterior_color_price = 10000;
        String interior_color_name = "name";
        String interior_color_img_url = "name";
        long interior_color_price = 100000;
        List<SimpleOption> optionList =
                Collections.singletonList(
                        new SimpleOption("Option name", 10000L, "option_img.url"));
        String pdfUrl = "document.pdf";

        // when
        PdfInfo pdfInfo =
                PdfInfo.builder()
                        .id(id)
                        .car_image_url(carImageUrl)
                        .car_name(carName)
                        .engine_name(engineName)
                        .body_name(bodyName)
                        .driving_system_name(drivingSystem)
                        .trim_name(trimName)
                        .max_power(maxPower)
                        .max_torque(maxTorque)
                        .exterior_color_name(exterior_color_name)
                        .exterior_color_img_url(exterior_color_img_url)
                        .exterior_color_price(exterior_color_price)
                        .interior_color_name(interior_color_name)
                        .interior_color_img_url(interior_color_img_url)
                        .interior_color_price(interior_color_price)
                        .optionList(optionList)
                        .basic_price(basicPrice)
                        .pdf_url(pdfUrl)
                        .creationDate(LocalDateTime.now())
                        .build();

        // then
        assertThat(pdfInfo.getId()).isEqualTo(id);
        assertThat(pdfInfo.getCar_image_url()).isEqualTo(carImageUrl);
        assertThat(pdfInfo.getCar_name()).isEqualTo(carName);
        assertThat(pdfInfo.getOptionList()).isEqualTo(optionList);
        assertThat(pdfInfo.getBasic_price()).isEqualTo(basicPrice);
        assertThat(pdfInfo.getPdf_url()).isEqualTo(pdfUrl);
    }

    @DisplayName("pdf 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        String id = "1L";

        // when
        PdfInfo pdfInfo1 = PdfInfo.builder().id(id).car_name("option1").build();
        PdfInfo pdfInfo2 = PdfInfo.builder().id(id).car_name("option2").build();
        Set<PdfInfo> optionSet = new HashSet<>(Arrays.asList(pdfInfo1, pdfInfo2));

        // then
        AssertionsForClassTypes.assertThat(pdfInfo1).isEqualTo(pdfInfo2);
        AssertionsForClassTypes.assertThat(pdfInfo1.hashCode()).isEqualTo(pdfInfo2.hashCode());
        AssertionsForClassTypes.assertThat(optionSet.size()).isEqualTo(1);
    }

    @DisplayName("pdf의 setter를 테스트한다.")
    @Test
    void testPdfSetter() {
        // given
        String pdfUrl = "url";

        // when
        PdfInfo pdfInfo = PdfInfo.builder().build();
        pdfInfo.setPdf_url(pdfUrl);

        // then
        assertThat(pdfInfo.getPdf_url()).isEqualTo(pdfUrl);
    }
}
