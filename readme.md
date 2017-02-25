# Cloud Computing Project 

Build a Hello World Java Html5 project.
Deploy a basic running .war using jetty-runner
Demonstrate use of docker java container

# build continer with Java(JDK), Maven
```
docker build --tag cloud-computing:0.0.1 .
```

# run the docker container
```
docker run --rm -p 8080:8080 -it cloud-computing:0.0.1
```

