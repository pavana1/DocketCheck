From openjdk
From robotframework

WORKDIR /home/qa/PycharmProjects/pythonProject

ADD target/selenium-docker.jar		selenium-docker.jar
ADD target/selenium-docker-tests.jar	selenium-docker-tests.jar
ADD target/libs				libs

ADD test.robot		test.robot

ENTRYPOINT   java -cp selenium-docker.jar:selenium-docker-tests.jar  -DBROWSER=$BROWSER -DHUB_HOST=$HUB_HOST     robot test.robot

