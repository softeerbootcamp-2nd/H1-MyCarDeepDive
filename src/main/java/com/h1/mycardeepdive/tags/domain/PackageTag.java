package com.h1.mycardeepdive.tags.domain;

import com.h1.mycardeepdive.options.domain.Packages;
import java.util.Objects;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Getter
public class PackageTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "package_tag_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "package_id")
    private Packages packages;

    @ManyToOne
    @JoinColumn(name = "tag_id")
    private Tags tag;

    @Builder
    public PackageTag(Long id, Packages packages, Tags tag) {
        this.id = id;
        this.packages = packages;
        this.tag = tag;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PackageTag ptag = (PackageTag) o;
        return Objects.equals(id, ptag.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
