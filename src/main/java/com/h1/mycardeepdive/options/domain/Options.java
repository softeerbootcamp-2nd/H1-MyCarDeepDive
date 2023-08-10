package com.h1.mycardeepdive.options.domain;

import com.h1.mycardeepdive.global.entity.OptionBaseEntity;
import java.util.Objects;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Getter
public class Options extends OptionBaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "option_id")
    private Long id;

    @Column(name = "is_basic_option")
    private boolean isBasicOption;

    @Builder
    public Options(
            Long id,
            String name,
            String imgUrl,
            String summary,
            String description,
            long price,
            double chooseRate,
            Badge badgeName,
            boolean isBasicOption) {
        this.id = id;
        this.name = name;
        this.imgUrl = imgUrl;
        this.summary = summary;
        this.description = description;
        this.price = price;
        this.chooseRate = chooseRate;
        this.badgeName = badgeName;
        this.isBasicOption = isBasicOption;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Options option = (Options) o;
        return Objects.equals(id, option.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
