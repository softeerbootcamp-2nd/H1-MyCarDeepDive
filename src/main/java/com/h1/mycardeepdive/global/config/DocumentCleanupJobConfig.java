package com.h1.mycardeepdive.global.config;

import com.h1.mycardeepdive.pdf.domain.repository.PdfRepository;
import java.time.LocalDateTime;
import lombok.RequiredArgsConstructor;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
@EnableBatchProcessing
public class DocumentCleanupJobConfig {

    private final JobBuilderFactory jobBuilderFactory;
    private final StepBuilderFactory stepBuilderFactory;
    private final PdfRepository documentRepository;

    @Bean
    public Step deleteOldDocumentsStep() {
        return stepBuilderFactory
                .get("deleteOldDocumentsStep")
                .tasklet(
                        (stepContribution, chunkContext) -> {
                            LocalDateTime oneMonthAgo = LocalDateTime.now().minusMonths(1);

                            documentRepository.deleteByCreationDateBefore(oneMonthAgo);
                            return RepeatStatus.FINISHED;
                        })
                .build();
    }

    @Bean
    public Job documentCleanupJob() {
        return jobBuilderFactory.get("documentCleanupJob").start(deleteOldDocumentsStep()).build();
    }
}
