build:
	@dagger call build --src=. \
		--git-user=${GIT_USERNAME}

update:
	@dagger call update \
		--branch=main \
		--git-user=${GIT_USERNAME} \
		--repo=http://${GIT_HOST}/myapp.git \
		--git-email=${GIT_USERNAME}@git.educates.dev \
		--deploy_filepath=k8s/deployment.yaml \
		--forceWithLease=true \
		--image-url=xxx:xxx \
		--git_password=env:GIT_PASSWORD \

deploy:
	@dagger call deploy \
		--branch=main \
		--git-user=${GIT_USERNAME} \
		--repo=http://${GIT_HOST}/myapp.git \
		--git-email=${GIT_USERNAME}@git.educates.dev \
		--deploy_filepath=k8s/deployment.yaml \
		--forceWithLease=true \
		--image-url=xxx:xxx \
		--git_password=env:GIT_PASSWORD \
		--src=.
