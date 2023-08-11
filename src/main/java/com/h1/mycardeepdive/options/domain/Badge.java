package com.h1.mycardeepdive.options.domain;

public enum Badge {
    H_GENUINE("H Genuine Accessories"),
    N_PERFORMANCE("N Performance");
    private final String viewName;

    Badge(String viewName) {
        this.viewName = viewName;
    }

    public String getViewName() {
        return this.viewName;
    }
}
