package com.h1.mycardeepdive.pdf.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.lang.reflect.Method;
import org.junit.jupiter.api.BeforeEach;
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
    private static final String DOMAIN = "@naver.com";

    @Autowired private JavaMailSender emailSender;
    @Autowired private PdfService pdfService;
    private MailServiceImpl mailService;

    @BeforeEach
    void setup() {
        mailService = new MailServiceImpl(emailSender, pdfService);
    }

    @Test
    @DisplayName("email html 렌더링을 테스트한다.")
    public void testRenderMailHtml() {
        try {
            // given

            Method renderMailHtmlMethod = MailServiceImpl.class.getDeclaredMethod("renderMailHtml");
            renderMailHtmlMethod.setAccessible(true);

            // when
            String renderedHtml = (String) renderMailHtmlMethod.invoke(mailService);

            // then
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

    @Test
    @DisplayName("이메일 도메인을 생성한다.")
    public void createEmailDomainTest() {

        try {
            // given
            String name = "testUser";
            MailServiceImpl mailService = new MailServiceImpl(emailSender, pdfService);
            Class<?>[] parameterTypes = new Class<?>[] {String.class};
            Method renderMailHtmlMethod =
                    MailServiceImpl.class.getDeclaredMethod("createEmailDomain", parameterTypes);
            renderMailHtmlMethod.setAccessible(true);

            // when
            String createdEmail = (String) renderMailHtmlMethod.invoke(mailService, name);

            // then
            assertEquals(createdEmail, "testUser@naver.com");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
