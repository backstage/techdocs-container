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

## Release

1. When you are ready to create a new release head over to [releases](https://github.com/backstage/techdocs-container/releases) and click on `Draft a new release`.

2. Use an incremental version number for the release e.g. v2.2.1 and use that as the tag version. Github will create a new tag if the tag doesn't exist. Fill out the rest of the fields and click `Publish release`.

The release flow is managed by a [GitHub actions workflow](.github/workflows/release-tag.yml). Whenever a new [release](https://github.com/backstage/techdocs-container/releases) is published on GitHub, the workflow pushes the tag to [DockerHub](https://hub.docker.com/r/spotify/techdocs).

Note: The `latest` tag on DockerHub points to the recent commits in the `main` branch. This is configured by the [main workflow](.github/workflows/main.yml). We recommend using a specific version of the container instead of `latest` release for stability and avoiding unexpected changes.

## License

Copyright 2020-2021 © The Backstage Authors. All rights reserved. The Linux Foundation has registered trademarks and uses trademarks. For a list of trademarks of The Linux Foundation, please see our Trademark Usage page: https://www.linuxfoundation.org/trademark-usage

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
