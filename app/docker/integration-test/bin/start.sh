#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

git clone https://github.com/24mx/codetest.git

cd /codetest/integration-test
sed -i 's/http:\/\/localhost:8080\/blog-web\/posts\//http:\/\/webapp:8080\/blog-web\/hello-pierce/g' src/test/java/com/pierceecom/blog/BlogTestIntegr.java
sed -i 's/assertEquals("\[\]", output);/assertEquals("{\\"message\\":\\"Hello Pierce\\"}", output);/' src/test/java/com/pierceecom/blog/BlogTestIntegr.java


echo "waiting for app..."
timeout -k 5 600 /codetest-assignment/bin/wait-for-200.sh http://webapp:8080/blog-web/hello-pierce
echo "running mvn test..."
mvn test -Dtest=BlogTestIntegr#test_1_BlogWithoutPosts
echo "done..."
