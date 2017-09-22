FROM php:7.0

LABEL maintainer "Eduardo Bizarro <eduardo@zendev.com.br>" \
      php="7.0" \
      node="5"

# Set correct environment variables
ENV HOME="/root" \
    COMPOSER_HOME=$HOME/composer \
    COMPOSER_ALLOW_SUPERUSER=1

ENV PATH $HOME/.yarn/bin:$PATH

WORKDIR /tmp

# COPY INSTALL SCRIPTS
COPY ./scripts/*.sh /tmp/
RUN chmod +x /tmp/*.sh

# Install
RUN bash ./packages.sh \
    && bash ./extensions.sh \
    && bash ./composer.sh \
    && bash ./node.sh \
    && bash ./cleanup.sh

WORKDIR /root
