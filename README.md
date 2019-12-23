### Prerequisites
- Linux
  - docker and docker-compose installed
  - or vagrant and virtualbox installed

- Windows or MacOS
  - vagrant and virtualbox installed

### Starting
- Linux
  - Run command: `docker-compose -f jenkins/docker-compose.yml up -d --build`
  - or if you would like to use vagrant, run command: `vagrant up`

- Windows and MacOS
  - Run command: `vagrant up`

### Running
- In order to run the blog-web app docker container and second docker contanier for the integration test, follow this steps:
  - Open `http://localhost:8181`
    - login: admin
    - password: `<empty>`
    - build `codetest-assignment` job
      - that pipeline will create two docker containers, one for app, and the second for the test integration, it gets codetest application from the repo, build, copy artifact to the first container and run webapp on it and perform integration tests from the second container, after that it will remove containers (please take a look to that jenkins job logs, to find out the integration test results)

### Troubleshooting
- If something goes wrong, you can easily clean up everything like this:
  - Linux
    - `docker-compose -f app/docker/docker-compose.yml down -v; docker-compose -f jenkins/docker-compose.yml down -v`
  - Windows or MacOS
    - `vagrant destory`
    - or you can log in to vm `vagrant ssh` and run e.g. `docker-compose -f app/docker/docker-compose.yml down -v; docker-compose -f jenkins/docker-compose.yml down -v`
