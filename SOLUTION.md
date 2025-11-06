# Solution Steps

1. Create a Dockerfile in the root directory of your go project.

2. Set up a multi-stage build in the Dockerfile: use a golang:alpine image for building, then copy the built binary to a clean alpine image.

3. In the builder stage, set the work directory, copy the project files, and build the Go app as a statically-linked binary.

4. In the final stage, copy only the resulting binary and set the necessary working directory.

5. Expose the port (8080) that the Go API serves on.

6. Add a HEALTHCHECK instruction to the Dockerfile (and duplicate it in docker-compose.yml for flexibility). The health check should perform a HTTP GET to /health.

7. Set the CMD to execute the todo-api binary.

8. Create a docker-compose.yml file in the root directory.

9. In docker-compose.yml, define a service that builds from the local Dockerfile, publishes port 8080, and sets up a healthcheck using wget to the /health endpoint.

10. Test the setup by running 'docker-compose up --build' and then accessing http://localhost:8080 from your browser or API tool.

11. Verify that the service is healthy using 'docker-compose ps' and run/stop/clean containers as required.

