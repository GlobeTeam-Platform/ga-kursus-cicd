import sys

import anyio
import dagger


async def main():
    async with dagger.Connection(dagger.Config(log_output=sys.stderr)) as client:
        build = client.host().directory(".").docker_build()
        await build.publish("jeremyatdockerhub/myexample:latest")

anyio.run(main)