# Copyright 2020 Spotify AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM python:3.8-alpine

RUN apk update && apk --no-cache add gcc musl-dev openjdk17-jdk curl graphviz ttf-dejavu fontconfig

# Download plantuml file, Validate checksum & Move plantuml file
RUN curl -o plantuml.jar -L https://sourceforge.net/projects/plantuml/files/1.2023.7/plantuml.1.2023.7.jar/download && echo "93fe1101c59381e0b3af86262b844871ca0eb987  plantuml.jar" | sha1sum -c - && mv plantuml.jar /opt/plantuml.jar

RUN pip install --upgrade pip && pip install mkdocs-techdocs-core==1.2.1

# Create script to call plantuml.jar from a location in path
#   When adding TechDocs to the Backstage Backend container, avoid this
#   error (OSError: [Errno 8] Exec format error: 'plantuml') by using the
#   following RUN command instead:
#   RUN echo '#!/bin/sh\n\njava -jar '/opt/plantuml.jar' ${@}' >> /usr/local/bin/plantuml
RUN echo $'#!/bin/sh\n\njava -jar '/opt/plantuml.jar' ${@}' >> /usr/local/bin/plantuml
RUN chmod 755 /usr/local/bin/plantuml

ENTRYPOINT [ "mkdocs" ]
