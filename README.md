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

    ```dockerfile
    FROM perl:latest
    RUN curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious
    ENV MOJO_LISTEN http://*:8080
    ADD . /app
    EXPOSE 8080
    WORKDIR /app
    RUN chmod +x main.pl
    CMD ["./main.pl", "daemon"]
    ```
4. Create a project in the [Google Developers Console](https://console.developers.google.com/).

5. Make sure you have the [Google Cloud SDK](https://cloud.google.com/sdk/) installed. 

    ```sh
    $ curl https://sdk.cloud.google.com | bash 
    $ gcloud auth login
    $ gcloud components update app
    ```

6. Deploy your app:

    ```sh
    gcloud preview app deploy app.yaml --set-default --project [your-project-id]
    ```

You are now running perl on App Engine. How cool is that?  Check it out at [https://perl-demo.appspot.com/](https://perl-demo.appspot.com/).
