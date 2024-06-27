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
You can see that it runs Dagger call, and then adds a lot of different variables, used in our pipeline. 

Using makefiles, is a lot easier, than remembering the correct syntax for a command or a job, and you will often find them in the root, of projects, on Github etc. 



