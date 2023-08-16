FROM debian:latest
LABEL authors="iosiffuterman"

RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3
RUN apt-get clean

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

#Switching to stable channel
RUN flutter channel stable
RUN flutter pub cash repair
RUN flutter upgrade

#Enabling web platform
RUN flutter config --enable-web