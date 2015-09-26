# Perl Dancer -> Google App Engine

This is a simple guide to running perl dancer on Google App Engine. 

1. [Create a new perldancer app](http://perldancer.org/)

2. Create an `app.yaml` in the root of your application with the following contents:

    ```yaml
    runtime: custom
    vm: true
    api_version: 1
    ```

3. Create a `Dockerfile` in the root of your application with the following contents:

    ```dockerfile
    FROM perl:latest
    RUN cpanm Dancer2
    ADD . /app
    EXPOSE 8080
    WORKDIR /app
    CMD ["plackup", "-r", "bin/app.psgi", "--port", "8080"]
    ```
4. Create a project in the [Google Developers Console](https://console.developers.google.com/).

5. Make sure you have the [Google Cloud SDK](https://cloud.google.com/sdk/) installed. 

    ```sh
    $ curl https://sdk.cloud.google.com | bash 
    $ gcloud init
    $ gcloud components update app
    ```

6. Deploy your app:

    ```sh
    gcloud preview app deploy app.yaml --set-default --project [your-project-id]
    ```

You are now running perl on App Engine. How cool is that?  Check it out at [https://perldancer-demo.appspot.com/](https://perldancer-demo.appspot.com/).
