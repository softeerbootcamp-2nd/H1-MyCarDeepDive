package com.h1.mycardeepdive.car.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "car_id")
    private Long id;

    private String name;

    private int price;

    private String comment;

    @Builder
    public Car(Long id, String name, int price, String comment) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.comment = comment;
    }

}
