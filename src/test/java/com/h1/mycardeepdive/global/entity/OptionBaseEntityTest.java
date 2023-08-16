package com.h1.mycardeepdive.global.entity;

import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.options.domain.Badge;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class OptionBaseEntityTest {
    @Test
    @DisplayName("OptionBaseEntity의 메서드 테스트")
    public void testOptionBaseEntity() {
        // given
        String name = "Test Option";
        String summary = "Test summary";
        long price = 10000L;
        double chooseRate = 0.75;
        Badge badge = Badge.H_GENUINE;

        // when
        OptionBaseEntity option = new OptionBaseEntityImpl(name, summary, price, chooseRate, badge);

        // then
        assertEquals(name, option.getName());
        assertEquals(summary, option.getSummary());
        assertEquals(price, option.getPrice());
        assertEquals(chooseRate, option.getChooseRate());
        assertEquals(badge, option.getBadgeName());
    }

    private static class OptionBaseEntityImpl extends OptionBaseEntity {
        OptionBaseEntityImpl(
                String name, String summary, long price, double chooseRate, Badge badgeName) {
            this.name = name;
            this.summary = summary;
            this.price = price;
            this.chooseRate = chooseRate;
            this.badgeName = badgeName;
        }
    }
}
