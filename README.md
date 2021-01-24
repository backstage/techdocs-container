# techdocs-container

This is the Docker container that powers the creation of static documentation sites that are supported by [TechDocs](https://github.com/backstage/backstage/blob/master/plugins/techdocs).

## Getting Started

Using the TechDocs CLI, we can invoke the latest version of `techdocs-container` via Docker Hub:

```bash
npx @techdocs/cli serve
```

## Local Development

```bash
docker build . -t mkdocs:local-dev

docker run -w /content -v $(pwd)/mock-docs:/content -p 8000:8000 -it mkdocs:local-dev serve -a 0.0.0.0:8000
```

Then open up `http://localhost:8000` on your local machine.

## Publishing

This container is published on DockerHub - https://hub.docker.com/r/spotify/techdocs

The release flow is managed by a [GitHub actions workflow](.github/workflows/release-tag.yml). Whenever a new [release](https://github.com/backstage/techdocs-container/releases) is published on GitHub, the workflow pushes the tag to DockerHub.

The `latest` tag on Docker Hub points to the recent commits in the `main` branch. This is configured by the [main workflow](.github/workflows/main.yml).

Note: We recommend using a specific version of the container instead of `latest` release for stability and avoiding unexpected changes.
