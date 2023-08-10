package com.h1.mycardeepdive.options.domain;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class BadgeTest {
    @DisplayName("")
    @Test
    public void testGetViewName() {
        // given
        Badge hGenuine = Badge.H_GENUINE;
        Badge nPerformance = Badge.N_PERFORMANCE;

        // when&then
        assertEquals("H Genuine Accessories", hGenuine.getViewName());
        assertEquals("N Performance", nPerformance.getViewName());
    }
}