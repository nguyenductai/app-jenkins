# # Use an official Ubuntu as a base image
# FROM ubuntu:20.04

# # Set the working directory
# WORKDIR /app

# # # Prevent interactive prompts from blocking the installation
# # # ENV DEBIAN_FRONTEND=noninteractive

# # # Install necessary tools and dependencies
# # RUN apt-get update && \
# #     apt-get install -y --no-install-recommends \
# #     wget \
# #     curl \
# #     unzip \
# #     xz-utils \
# #     git \
# #     libglu1-mesa \
# #     openjdk-11-jdk \
# #     ca-certificates && \
# #     rm -rf /var/lib/apt/lists/*

# # # Install Flutter SDK
# # RUN git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter

# # # Set Flutter environment variables
# # ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# # # Install Android SDK command-line tools
# # RUN mkdir -p /usr/local/android-sdk-linux/cmdline-tools/latest && \
# #     cd /usr/local/android-sdk-linux/cmdline-tools/latest && \
# #     wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -O commandlinetools.zip && \
# #     unzip commandlinetools.zip && \
# #     rm commandlinetools.zip

# # # Set Android environment variables
# # ENV ANDROID_HOME="/usr/local/android-sdk-linux"
# # ENV PATH="${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${PATH}"

# # # Install Android SDK components
# # RUN yes | sdkmanager --licenses && \
# #     sdkmanager --update && \
# #     sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"

# # # Run Flutter doctor to install dependencies
# # RUN flutter doctor

# # # Copy project files to the working directory
# # COPY . .

# # # Get Flutter packages
# # RUN flutter pub get

# # # Build the Flutter app (you can customize this part depending on your needs)
# # #RUN flutter build apk --release

# # # Define the entry point for the container (optional)
# # # CMD ["flutter", "run", "--release"]

#================v2--------------
# FROM runmymind/docker-android-sdk:ubuntu-standalone-20240227
# COPY . .
# RUN apt install git
# RUN git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter

# case=====1

#Use the base image
FROM runmymind/docker-android-sdk:ubuntu-standalone-20240227

# Set the working directory
WORKDIR /app

# Install necessary dependencies for Flutter
RUN apt-get update && \
    apt-get install -y curl git unzip xz-utils libglu1-mesa

# Set up environment variables for Flutter
ENV FLUTTER_HOME=/usr/local/flutter
ENV PATH=$FLUTTER_HOME/bin:$PATH

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_HOME

#RUN git -C $FLUTTER_HOME checkout 3.10.0
# RUN curl -o flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.0-stable.tar.xz && \
#     mkdir -p $FLUTTER_HOME && \
#     tar xf flutter.tar.xz -C $FLUTTER_HOME --strip-components=1 && \
#     rm flutter.tar.xz

# Run Flutter doctor to verify installation (optional)

COPY . .

RUN flutter build apk 
#RUN flutter pub get
#RUN flutter doctor -v

#Create Jenkins user and set permissions
RUN useradd -ms /bin/bash jenkins
RUN chown -R jenkins:jenkins /app

USER jenkins

# Set the working directory for the Jenkins user
WORKDIR /app

# Copy the Flutter project into the Docker container
COPY . /app

# RUN flutter build apk 

# #Ensure the output directory exists and has correct permissions
# RUN mkdir -p /app/build/app/outputs/flutter-apk && \
#     chown -R jenkins:jenkins /app/build

#Expose the build output as a volume (optional)
VOLUME /app/build/app/outputs/flutter-apk


#-----end 

# Expose any ports if needed
# EXPOSE 8080

# Define the command to run your application
# CMD ["executable","param1","param2"]
#===========end=====v2--------------

# Use the base image
# FROM runmymind/docker-android-sdk:ubuntu-standalone-20240227

# # Set the working directory
# WORKDIR /app

# # Install necessary dependencies for Flutter
# RUN apt-get update && \
#     apt-get install -y curl git unzip xz-utils libglu1-mesa && \
#     apt-get upgrade -y

# # Set up environment variables for Flutter
# ENV FLUTTER_HOME=/usr/local/flutter
# ENV PATH=$FLUTTER_HOME/bin:$PATH

# # Install Flutter SDK version 3.10.0
# RUN curl -o flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.0-stable.tar.xz && \
#     mkdir -p $FLUTTER_HOME && \
#     tar xf flutter.tar.xz -C $FLUTTER_HOME --strip-components=1 && \
#     rm flutter.tar.xz

# Install Flutter dependencies
#RUN flutter doctor
#RUN flutter precache

# Create Jenkins user and set permissions
#RUN useradd -ms /bin/bash jenkins
#RUN chown -R jenkins:jenkins /app

#USER jenkins

# # Set the working directory for the Jenkins user
#WORKDIR /app

# # Copy the Flutter project into the Docker container
#COPY . /app

# Run the Flutter build command
#RUN flutter build apk 

# Ensure the output directory exists and has correct permissions
# RUN mkdir -p /app/build/app/outputs/flutter-apk && \
#     chown -R jenkins:jenkins /app/build

# Expose the build output as a volume (optional)
#VOLUME /app/build/app/outputs/flutter-apk

