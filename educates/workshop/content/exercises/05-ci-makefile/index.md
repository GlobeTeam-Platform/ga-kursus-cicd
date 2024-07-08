---
title: "CI - Makefile"
---

To run the pipelines/functions we need to use the dagger cli, with a lot of options, for the variable inputs, that each functions requires.

To make this easier, we are utilizing [Makefiles](https://www.gnu.org/software/make/).

Makefiles is a simple way, of automation commands, jobs etc. 

They simply require you to have make installed, and to have a `Makefile` in the current directory.

Our Makefile looks like this, and is located in the app folder.

```yaml
build:
	@dagger call build --src=.

update:
	@dagger call update \
		--branch=main \
		--git-user=${GIT_USERNAME} \
		--repo=http://${GIT_HOST}/myapp.git \
		--git-email=${GIT_USERNAME}@git.educates.dev \
		--deploy_filepath=deployment.yaml \
		--forceWithLease=true \
		--image-url=xxx:xxx \
		--git_password=env:GIT_PASSWORD \

deploy:
	@dagger call deploy \
		--branch=main \
		--git-user=${GIT_USERNAME} \
		--repo=http://${GIT_HOST}/myapp.git \
		--git-email=${GIT_USERNAME}@git.educates.dev \
		--deploy_filepath=deployment.yaml \
		--forceWithLease=true \
		--image-url=xxx:xxx \
		--git_password=env:GIT_PASSWORD \
		--src=.
```
You can see that it runs the same Dagger calls, as in our previus step, and then adds a lot of different variables, that we need pipeline. 

Using makefiles, is a lot easier, than remembering the correct syntax for a command or a job, and you will often find them in the root, of projects, on Github etc. 

Let's open the app folder, and run the `make deploy` command, in terminal 2, to test it.

```execute-2
  cd ~/exercises/app
  make deploy
```
Note it might take some time, the first time you run it, since Dagger needs to download the containers, and run the build inside them

The output should be something like this

```
ttl.sh/educates-cli-w04-s001@sha256:b1631c8050f8dddb15ad1129e50cb9bc5f7811bcd446b122fa72c15c82356124
```

This means that our container has been build, and has been pushed to the registry ttl.sh with our username for name, and the sha for label, and that url, has been updated in the deployment yaml files.

This is usefull, since we can point our deoployment directly, to this specific container and id, when we deploy it.

More on that later.