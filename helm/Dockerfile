ARG HELM_PACKAGES="\
curl \
"

FROM base

LABEL org.opencontainers.image.source=https://github.com/victorposada/imgs

RUN apk --update --no-cache add ${HELM_PACKAGES}