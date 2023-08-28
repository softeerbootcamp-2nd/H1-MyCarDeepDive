# H1-MyCarDeepDive

프로젝트 겟차를 진행하게 된 H1 팀 마이카 딥 다이브(MyCar Deep Dive) 입니다.

## ERD

![](https://github.com/softeerbootcamp-2nd/H1-MyCarDeepDive/assets/73146678/785bec39-f8bf-49db-8bd0-976db353408d)

## Architecture
![](https://github.com/softeerbootcamp-2nd/H1-MyCarDeepDive/assets/73146678/11d66869-aed1-4478-9ab9-e439e7705722)

## CI/CD
![](https://github.com/softeerbootcamp-2nd/H1-MyCarDeepDive/assets/73146678/8c90869a-87fe-4f50-a794-6344b872ef09)

## API Specs

https://api.make-my-car.shop/docs/swagger

## Tech Spec
[Backend]
- Java 11
- Spring Boot 2.7.1
- Spring Data JPA
- Querydsl
- SwaggerUI/RestDocs

[Database]
- MySQL 8.0.34
- H2 Database
- Flyway

[Testing]
- Jacoco
- MockMVC

[DevOps]
- Github Action
- Docker
- Spotless
- AWS EC2 (Ubuntu 18.04)
- AWS S3
- AWS CloudFront

[Logging]
- Actuator
- Grafana
- Prometheus
- Filebeat
- Logstash
- ElasticSearch
- Kibana

[ETC]
- AWS Parameter Store


## Code Convention

- [Java Style Guide](https://google.github.io/styleguide/javaguide.htmls)
- Reformat Code
	- MacOS: `Ctrl + Opt + L`
	- Windows/Linux: `Ctrl + Alt + L`
- Optimize Imports
	- MacOS: `Ctrl + Opt + O`
	- Windows/Linux: `Ctrl + Alt + O`

## Commit Message Convention

- feat (feature)
- fix (bug fix)
- docs (documentation)
- style (formatting, missing semi colons, …)
- refactor
- test (when adding missing tests)
- chore (maintain)