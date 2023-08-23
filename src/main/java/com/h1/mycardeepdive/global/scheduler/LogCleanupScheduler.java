package com.h1.mycardeepdive.global.scheduler;

import java.io.File;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class LogCleanupScheduler {

    private static final String LOG_FOLDER_PATH = "/tmp/log/mycardeepdive";

    @Scheduled(cron = "0 0 0 * * MON")
    public void cleanupLogs() {
        File logFolder = new File(LOG_FOLDER_PATH);
        if (logFolder.exists() && logFolder.isDirectory()) {
            cleanupFiles(logFolder);
        }
    }

    private void cleanupFiles(File folder) {
        File[] files = folder.listFiles();
        if (files != null) {
            for (File file : files) {
                if (!file.delete()) {
                    log.warn("Failed to delete file: {}", file.getName());
                }
            }
        }
    }
}
