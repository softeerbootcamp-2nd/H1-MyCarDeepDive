package com.h1.mycardeepdive.car.domain;

import java.util.Objects;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class Engine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "engine_id")
    private Long id;

    private String name;

    private String description;

    private String imgUrl;

    private String maxPower;

    private String maxTorque;

    @Builder
    public Engine(
            Long id,
            String name,
            String description,
            String imgUrl,
            String maxPower,
            String maxTorque) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.imgUrl = imgUrl;
        this.maxPower = maxPower;
        this.maxTorque = maxTorque;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Engine engine = (Engine) o;
        return Objects.equals(id, engine.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
