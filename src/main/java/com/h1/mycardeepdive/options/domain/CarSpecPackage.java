package com.h1.mycardeepdive.options.domain;

import com.h1.mycardeepdive.car.domain.CarSpec;
import java.util.Objects;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Getter
public class CarSpecPackage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "carspec_package_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "car_spec_id")
    private CarSpec carSpec;

    @ManyToOne
    @JoinColumn(name = "package_id")
    private Package _package;

    @Builder
    public CarSpecPackage(Long id, CarSpec carSpec, Package _package) {
        this.id = id;
        this.carSpec = carSpec;
        this._package = _package;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CarSpecPackage carSpecPackage = (CarSpecPackage) o;
        return Objects.equals(id, carSpecPackage.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
