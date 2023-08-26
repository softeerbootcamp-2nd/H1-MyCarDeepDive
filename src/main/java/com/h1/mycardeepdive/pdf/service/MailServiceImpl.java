package com.h1.mycardeepdive.pdf.service;

import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.h1.mycardeepdive.exception.ErrorType;
import com.h1.mycardeepdive.exception.MyCarDeepDiveException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpStatus;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class MailServiceImpl implements MailService {
    private static final String BUTTON_IMG =
            "https://cdn-icons-png.flaticon.com/512/3154/3154400.png";
    private static final String PURCHASE_LINK =
            "https://www.hyundai.com/kr/ko/e/vehicles/purchase-consult";
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

        helper.setText(renderMailHtml(), true);
        helper.setFrom(new InternetAddress(username + "@naver.com", "MyCarDeepDive"));

        try {
            byte[] pdfBytes = pdfService.generatePdf(pdfId);
            helper.addAttachment(
                    "내차만들기견적서.pdf", new ByteArrayResource(pdfBytes), "application/pdf");
        } catch (Exception e) {
            throw new MyCarDeepDiveException(HttpStatus.BAD_REQUEST, ErrorType.PDF_CREATE_ERROR);
        }
        emailSender.send(message);
        return true;
    }

    private String renderMailHtml() {
        String msgg = "<div style='margin:100px;'>";
        msgg += "<h1> 안녕하세요 </h1>";
        msgg += "<h1> 현대자동차 내차만들기 MyCarDeepDive 입니다. </h1>";
        msgg += "<br>";
        msgg += "<h3> 요청하신 pdf 견적서 파일입니다. </h3>";
        msgg += "<h2> 차 구매하러 가기 </h2><br>";
        msgg += "<a href='" + PURCHASE_LINK + "'>";
        msgg += "<img src=" + BUTTON_IMG + " width=100px height=auto>";
        msgg += "</a>";
        msgg += "</div>";

        return msgg;
    }
}
