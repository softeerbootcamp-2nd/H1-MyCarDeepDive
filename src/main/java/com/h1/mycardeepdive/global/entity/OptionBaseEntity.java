package com.h1.mycardeepdive.global.entity;

import com.h1.mycardeepdive.options.domain.Badge;
import javax.persistence.*;
import lombok.Getter;

@MappedSuperclass
@Getter
public abstract class OptionBaseEntity {
    protected String name;

    protected String imgUrl;

    protected String summary;

    protected String description;

    protected long price;

    @Column(name = "choose_rate")
    protected double chooseRate;

    @Enumerated(EnumType.STRING)
    protected Badge badgeName;
}
