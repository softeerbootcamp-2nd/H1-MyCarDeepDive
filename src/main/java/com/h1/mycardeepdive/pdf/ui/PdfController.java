package com.h1.mycardeepdive.pdf.ui;

import com.h1.mycardeepdive.global.response.ApiResponse;
import com.h1.mycardeepdive.pdf.service.MailServiceImpl;
import com.h1.mycardeepdive.pdf.service.PdfService;
import com.h1.mycardeepdive.pdf.ui.dto.CarInformation;
import com.h1.mycardeepdive.pdf.ui.dto.PdfIdRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
public class PdfController {
    private final MailServiceImpl mailService;

    private final PdfService pdfService;

    @GetMapping("/pdf/{pdf-id}/email/{email}")
    public ApiResponse<Boolean> sendEmail(
            @PathVariable("email") String email, @PathVariable("pdf-id") String pdfId)
            throws Exception {
        mailService.createMessage(email, pdfId);
        return new ApiResponse<>(true);
    }

    @PostMapping("/pdfId")
    public ApiResponse<String> getPdfId(@RequestBody PdfIdRequest pdfIdRequest) throws Exception {
        return new ApiResponse<>(pdfService.registerPdfId(pdfIdRequest));
    }

    @GetMapping("/pdf/{pdf-id}")
    public ApiResponse<String> getPdfUrl(@PathVariable("pdf-id") String pdfId) throws Exception {
        return new ApiResponse<>(pdfService.findPdf(pdfId));
    }

    @GetMapping("/pdf/{pdf-id}/car-information")
    public ApiResponse<CarInformation> getCarInformation(@PathVariable("pdf-id") String pdfId)
            throws Exception {
        return new ApiResponse<>(pdfService.findCarInformation(pdfId));
    }
}
