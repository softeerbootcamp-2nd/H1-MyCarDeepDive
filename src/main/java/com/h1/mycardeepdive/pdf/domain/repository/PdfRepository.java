package com.h1.mycardeepdive.pdf.domain.repository;

import com.h1.mycardeepdive.pdf.domain.PdfInfo;
import java.time.LocalDateTime;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PdfRepository extends MongoRepository<PdfInfo, String> {
    void deleteByCreationDateBefore(LocalDateTime date);
}
