package com.h1.mycardeepdive.car.domain;

import java.util.Objects;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "car_id")
    private Long id;

    private String name;

    private String comment;

    @Builder
    public Car(Long id, String name, String comment) {
        this.id = id;
        this.name = name;
        this.comment = comment;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Car car = (Car) o;
        return Objects.equals(id, car.id)
                && Objects.equals(name, car.name)
                && Objects.equals(comment, car.comment);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, comment);
    }
}
