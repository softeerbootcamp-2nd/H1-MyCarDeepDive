package com.h1.mycardeepdive.pdf.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.lang.reflect.Method;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@SpringBootTest
class MailServiceImplTest {
    private static final String BUTTON_IMG =
            "https://cdn-icons-png.flaticon.com/512/3154/3154400.png";
    private static final String PURCHASE_LINK =
            "https://www.hyundai.com/kr/ko/e/vehicles/purchase-consult";
    @Autowired private JavaMailSender emailSender;
    @Autowired private PdfService pdfService;

    @Test
    @DisplayName("email html 렌더링을 테스트한다.")
    public void testRenderMailHtml() {
        try {
            MailServiceImpl mailService = new MailServiceImpl(emailSender, pdfService);
            Method renderMailHtmlMethod = MailServiceImpl.class.getDeclaredMethod("renderMailHtml");
            renderMailHtmlMethod.setAccessible(true);

            String renderedHtml = (String) renderMailHtmlMethod.invoke(mailService);

            String expectedHtml =
                    "<div style='margin:100px;'>"
                            + "<h1> 안녕하세요 </h1>"
                            + "<h1> 현대자동차 내차만들기 MyCarDeepDive 입니다. </h1>"
                            + "<br>"
                            + "<h3> 요청하신 pdf 견적서 파일입니다. </h3>"
                            + "<h2> 차 구매하러 가기 </h2><br>"
                            + "<a href='"
                            + PURCHASE_LINK
                            + "'>"
                            + "<img src="
                            + BUTTON_IMG
                            + " width=100px height=auto>"
                            + "</a>"
                            + "</div>";

            assertEquals(expectedHtml, renderedHtml);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
