### Prerequisites
- Linux
  - docker and docker-compose installed
  - or Vagrant and Virtualbox installed

- Windows or MacOS
  - Vagrant and Virtualbox installed

### Starting
- Linux
  - Run command: `docker-compose -f jenkins/docker-compose.yml up -d --build`
  - or if you would like to use Vagrant, run command: `vagrant up`

- Windows and MacOS
  - Run command: `vagrant up`

### Running
- In order to run the blog-web app docker container and second docker contanier for the integration test, follow this steps:
  - Open `http://localhost:8181`
    - login: admin
    - password: `<empty>`
    - build `codetest-assignment` job
      - that pipeline will create two docker containers, one for app, and the second for the test integration. The job gets codetest application from the repo, builds the application, copies the artifact to the first container and runs webapp on this container. Next it performs integration tests from the second container, and after that it will remove these containers (please take a look to that jenkins job logs, to find out the integration test results)
    - to better experience feel free to use the Blue Ocean plugin `http://localhost:8181/blue`

<p align="center">
  <img src="https://raw.githubusercontent.com/rutkomi/codetest-assignment/master/misc/pipeline.png" alt="Pipeline"/>
</p>
<p align="center">
  <img src="https://raw.githubusercontent.com/rutkomi/codetest-assignment/master/misc/maven-logs.png" alt="Maven logs"/>
</p>

### Troubleshooting
- If something goes wrong, you can easily clean up everything like this:
  - Linux
    - `docker-compose -f app/docker/docker-compose.yml down -v; docker-compose -f jenkins/docker-compose.yml down -v`
  - Windows or MacOS (and Linux if you have used Vagrant)
    - `vagrant destory`
    - or you can log in to vm `vagrant ssh` and run e.g. `docker-compose -f app/docker/docker-compose.yml down -v; docker-compose -f jenkins/docker-compose.yml down -v`
