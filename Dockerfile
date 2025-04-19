FROM jetpackio/devbox:0.14.2

# Installing your devbox project
WORKDIR /code
USER root:root
RUN mkdir -p /code && chown ${DEVBOX_USER}:${DEVBOX_USER} /code
USER ${DEVBOX_USER}:${DEVBOX_USER}
COPY --chown=${DEVBOX_USER}:${DEVBOX_USER} devbox.json devbox.lock pyproject.toml uv.lock ./


RUN devbox run -- echo "Installed Packages." && nix-store --gc && nix-store --optimise

CMD ["devbox", "shell"]
