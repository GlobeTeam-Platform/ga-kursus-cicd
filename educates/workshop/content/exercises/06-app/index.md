---
title: "App"
---
What did we just build ?

The app we will be using today, is a simple one page website.

It's located in the `app` folder, under `html` and there is also a Dockerfile, that we use to package the app.

The dockerfile simply contains 
```yaml
FROM nginx:1

COPY ./html /usr/share/nginx/html
```

And all it does, is to use the Nginx image, and copy the local html folder, to the html folder in the container, so Nginx can publish it.

This means that the container contains all the files it needs, and can't be modified.

To make changes, you need to make the changes, in your Git repository, and then run the CI pipeline again, and get a container build.

This also means, we can easely revert to previus versions.

In the next step, we will look at how to deploy it.

