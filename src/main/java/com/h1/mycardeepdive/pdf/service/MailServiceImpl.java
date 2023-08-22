package com.h1.mycardeepdive.pdf.service;

import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class MailServiceImpl implements MailService {

    private final JavaMailSender emailSender;
    private final PdfService pdfService;

    @Value("${spring.mail.username}")
    private String username;

    @Override
    public boolean createMessage(String to, String pdfId)
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = emailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

        helper.setTo(to);
        message.setSubject("[현대자동차 MyCarDeepDive] 내차만들기 견적서");

        String msgg = "<div style='margin:100px;'>";
        msgg += "<h1> 안녕하세요 </h1>";
        msgg += "<h1> 현대자동차 내차만들기 MyCarDeepDive 입니다. </h1>";
        msgg += "<br>";
        msgg += "<h3> 요청하신 pdf 견적서 파일입니다. </h3>";
        String buttonImg = "https://cdn-icons-png.flaticon.com/512/3154/3154400.png";
        String link = "https://www.hyundai.com/kr/ko/e/vehicles/purchase-consult";

        msgg += "<h2> 차 구매하러 가기 </h2><br>";
        msgg += "<a href='" + link + "'>";
        msgg += "<img src=" + buttonImg + " width=100px height=auto>";
        msgg += "</a>";
        msgg += "</div>";
        helper.setText(msgg, true);

        helper.setFrom(new InternetAddress(username + "@naver.com", "MyCarDeepDive"));

        try {
            byte[] pdfBytes = pdfService.generatePdf(pdfId);
            helper.addAttachment(
                    "내차만들기견적서.pdf", new ByteArrayResource(pdfBytes), "application/pdf");
        } catch (Exception e) {
            // 예외 처리
        }
        emailSender.send(message);
        return true;
    }
}
