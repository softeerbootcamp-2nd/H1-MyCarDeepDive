package com.h1.mycardeepdive.pdf.service;

import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;

public interface MailService {
    boolean sendMessage(String to, String pdfId)
            throws MessagingException, UnsupportedEncodingException;
}
