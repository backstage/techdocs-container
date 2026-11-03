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

FROM python:3.15-alpine@sha256:ff4d3c9b1a48f646eedd93182aaea385c7a5452f4c8a8cd7cef686babacf4928

RUN apk update && apk --no-cache add gcc musl-dev openjdk17-jdk curl graphviz ttf-dejavu fontconfig

# Take the plantuml jar from the official image, pinned by tag and digest so Renovate
# keeps it updated.
COPY --from=plantuml/plantuml:1.2026.9@sha256:9b5071ab56a4192aac458ab4b0d42261c22c8109695894ae5be6013c3be6cac1 \
    /opt/plantuml.jar /opt/plantuml.jar

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Create script to call plantuml.jar from a location in path
#   When adding TechDocs with PlantUML diagrams, to refer external puml or pu files in any markdown file,
#   eg. '!include <referencedFileName.puml>', you'll need to include the diagrams directory eg. docs in the classpath.
#   Use following RUN command instead:
#   RUN printf '#!/bin/sh\nexec java -Dplantuml.include.path=${diagramDir} -jar /opt/plantuml.jar "$@"\n' > /usr/local/bin/plantuml && chmod 755 /usr/local/bin/plantuml

#   "$@", not ${@}: unquoted, docs paths containing spaces get split into separate args.
#   printf also copies as-is into the Backstage Backend container, where the echo form failed
#   with: OSError: [Errno 8] Exec format error: 'plantuml'
RUN printf '#!/bin/sh\nexec java -jar /opt/plantuml.jar "$@"\n' > /usr/local/bin/plantuml \
    && chmod 755 /usr/local/bin/plantuml

ENTRYPOINT [ "mkdocs" ]
