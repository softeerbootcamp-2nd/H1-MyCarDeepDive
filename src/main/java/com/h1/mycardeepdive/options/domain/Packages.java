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
public class Packages extends OptionBaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "package_id")
    private Long id;

    @Builder
    public Packages(
            Long id, String name, String summary, long price, double chooseRate, Badge badgeName) {
        this.id = id;
        this.name = name;
        this.summary = summary;
        this.price = price;
        this.chooseRate = chooseRate;
        this.badgeName = badgeName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Packages _packages = (Packages) o;
        return Objects.equals(id, _packages.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
