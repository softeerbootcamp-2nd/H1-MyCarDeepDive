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
public class Package extends OptionBaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "package_id")
    private Long id;

    @Builder
    public Package(
            Long id,
            String name,
            String imgUrl,
            String summary,
            String description,
            long price,
            double chooseRate,
            Badge badgeName) {
        this.id = id;
        this.name = name;
        this.imgUrl = imgUrl;
        this.summary = summary;
        this.description = description;
        this.price = price;
        this.chooseRate = chooseRate;
        this.badgeName = badgeName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Package _package = (Package) o;
        return Objects.equals(id, _package.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
