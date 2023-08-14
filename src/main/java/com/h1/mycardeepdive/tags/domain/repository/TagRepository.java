package com.h1.mycardeepdive.tags.domain.repository;

import com.h1.mycardeepdive.tags.domain.Tags;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TagRepository extends JpaRepository<Tags, Long>, TagRepositoryCustom {}
