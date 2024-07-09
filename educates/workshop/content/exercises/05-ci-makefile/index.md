---
title: "CI - Makefile"
---

To run the pipelines/functions we need to use the dagger cli, with a lot of options, for the variable inputs, that each function requires.

To make this easier, we are utilizing [Makefiles](https://www.gnu.org/software/make/).

Makefiles, is a lot easier, than remembering the correct syntax for a command or a job, and you will often find them in the root, of projects, on Github etc. 

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
	@git pull
```
You can see that it runs the same Dagger calls, as in our previus step, and then adds a lot of different variables, that we need in our pipeline. 

Wo do run a `git pull` command, after running deploy, to make sure our local git folder, is updated, with the changes that the deploy job does, to the deployment.yaml file.

Let's open the app folder, and run the `make deploy` command, in terminal 2, to test it.

```execute-2
  cd ~/exercises/app
  make deploy
```
Note it might take some time, the first time you run it, since Dagger needs to download the containers, and run the build inside them

When it's done, the output should be something like this

```
ttl.sh/educates-cli-w16-s001@sha256:9304404d8c3e29d06fd31f66db987a62a700a5ee53e608b0e5673b38b85e6ef3
remote: Enumerating objects: 7, done.
remote: Counting objects: 100% (7/7), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (4/4), 604 bytes | 604.00 KiB/s, done.
From http://git-educates-cli-w16-s001.192.168.50.243.nip.io/myapp
   b977049..62237b8  main       -> origin/main
Updating b977049..62237b8
Fast-forward
 k8s/deployment.yaml | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
```

The first line means that our container has been build, and has been pushed to the registry ttl.sh with our username for name, and the sha for label, and that url, has been updated in the deployment yaml files.

The label is usefull, since we can point our deoployment directly, to this specific container version, when we deploy it.

More on that later.