#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM devkitpro/devkitarm

RUN git clone https://github.com/pret/agbcc /opt/agbcc

# ** [Optional] Uncomment this section to install additional packages. **
#
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc  && \
    apt-get install -y --no-install-recommends g++ && \
    apt-get install -y --no-install-recommends libpng-dev && \
    apt-get install -y --no-install-recommends libarchive13 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN /opt/agbcc/install.sh
ENTRYPOINT [ "/opt/agbcc/build.sh", "/workspaces/pokefirered"]
