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

We will look at customizing it later.

But before that, we need to look at how we deploy it.
