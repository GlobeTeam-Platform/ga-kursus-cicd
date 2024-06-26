from typing import Annotated

import dagger
from dagger import Doc, dag, function, object_type


@object_type
class App:
    image_url: str = ""

    @function
    def build(
        self,
        src: Annotated[
            dagger.Directory,
            Doc("location of directory containing Dockerfile"),
        ],
        git_user: str,
    ) -> str:
        """Build and publish image from existing Dockerfile"""
        image_url = (
            dag.container()
            .with_directory("/src", src)
            .with_workdir("/src")
            .directory("/src")
            .docker_build()  # build from Dockerfile
            .publish("ttl.sh/"+git_user)
        )
        return image_url
    
    
    @function
    def update(self, repo: str, branch: str, deploy_filepath: str, image_url: str, git_user: str, git_email: str, git_password: dagger.Secret, force_with_lease: bool) -> None:
        """Update deployment file, with image name and version"""
        return (
            dag.image_updater()
            .update(repo, branch, deploy_filepath, image_url, git_user, git_email, git_password, force_with_lease)
        )

    @function
    async def deploy(self, src: Annotated[
            dagger.Directory,
            Doc("location of directory containing Dockerfile"),
            ],
            repo: str, 
            branch: str,
            deploy_filepath: str, 
            image_url: str,
            git_user: str, 
            git_email: str, 
            git_password: dagger.Secret, 
            force_with_lease: bool) -> str:
        
        image_url = await(self.build(src, git_user))
        await self.update(repo, branch, deploy_filepath, image_url, git_user, git_email, git_password, force_with_lease)
        """Create and push container image, and update deployment file, with the new image name and tag"""
        return image_url