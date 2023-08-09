package com.h1.mycardeepdive.global.config;

import java.util.HashMap;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.LazyConnectionDataSourceProxy;

@Configuration
public class DataSourceConfiguration {

    private static final String MASTER_SERVER = "MASTER";
    private static final String SLAVE_SERVER = "SLAVE";
    public static final String DATASOURCE_MASTER = "spring.datasource.master";
    public static final String DATASOURCE_SLAVE = "spring.datasource.slave";

    @Bean
    @Qualifier(MASTER_SERVER)
    @ConfigurationProperties(prefix = DATASOURCE_MASTER)
    public DataSource masterDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    public DataSource routingDataSource(
            @Qualifier(MASTER_SERVER) DataSource masterDataSource,
            @Qualifier(SLAVE_SERVER) DataSource slaveDataSource) {
        RoutingDataSource routingDataSource = new RoutingDataSource();

        HashMap<Object, Object> dataSourceMap = new HashMap<>();
        dataSourceMap.put("master", masterDataSource);
        dataSourceMap.put("slave", slaveDataSource);

        routingDataSource.setTargetDataSources(dataSourceMap);
        routingDataSource.setDefaultTargetDataSource(masterDataSource);

        return routingDataSource;
    }

    @Bean
    @Primary
    public DataSource dataSource() {
        DataSource determinedDataSource = routingDataSource(masterDataSource(), slaveDataSource());
        return new LazyConnectionDataSourceProxy(determinedDataSource);
    }

    @Bean
    @Qualifier(SLAVE_SERVER)
    @ConfigurationProperties(prefix = DATASOURCE_SLAVE)
    public DataSource slaveDataSource() {
        return DataSourceBuilder.create().build();
    }
}
