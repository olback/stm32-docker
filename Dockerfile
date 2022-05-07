FROM ubuntu:22.04

ARG STM32INSTALLZIP=en.st-stm32cubeide_1.9.0_12015_20220302_0855_amd64.deb_bundle.sh.zip

# Update and install deps
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y unzip gcc-arm-none-eabi make ninja-build meson cmake

# Install stm32cubeide
ENV LICENSE_ALREADY_ACCEPTED=1
COPY ${STM32INSTALLZIP} /tmp/stm32cubeide.zip
WORKDIR /tmp
RUN unzip stm32cubeide.zip
RUN chmod +x st-stm32cubeide*.deb_bundle.sh
RUN echo y | ./$(ls st-stm32cubeide*.deb_bundle.sh)
RUN rm stm32cubeide.zip st-stm32cubeide*.deb_bundle.sh

# Copy build helper script
COPY stm32builder.sh /usr/bin/stm32builder

# Add user
RUN mkdir -p /etc/sudoers.d
RUN groupadd --gid 1000 stm \
    && useradd --uid 1000 --gid stm --shell /bin/bash --create-home stm \
    && echo 'stm ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-stm
USER stm

RUN mkdir /home/stm/.stm32workspace
RUN mkdir /home/stm/Project

WORKDIR /home/stm/Project

ENTRYPOINT [ "/usr/bin/stm32builder" ]
