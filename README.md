# Perl -> Google App Engine

This is a simple guide to running perl on Google App Engine. 

1. [Create a new mojolicious app](http://mojolicio.us/)

2. Create an `app.yaml` in the root of your application with the following contents:

    ```yaml
    runtime: custom
    vm: true
    api_version: 1
    ```

3. Create a `Dockerfile` in the root of your application with the following contents:

    ```yaml
    FROM perl:latest
    RUN curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious
    ENV MOJO_LISTEN http://*:8080
    ADD . /app
    EXPOSE 8080
    WORKDIR /app
    RUN chmod +x main.pl
    CMD ["./main.pl", "daemon"]
    ```

3. Deploy your app:

    ```sh
    gcloud preview app deploy app.yaml --set-default --project [project id]"
    ```

You are now running perl on App Engine. How cool is that?
