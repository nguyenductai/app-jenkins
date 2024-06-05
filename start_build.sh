# #!/bin/sh

# # Check if pubspec.yaml exists
# getVersion(){
#     if [ ! -f pubspec.yaml ]; then
#   echo "Error: pubspec.yaml file not found!"
#   exit 1
# fi

# # Extract the version from pubspec.yaml
# version=$(grep '^version:' pubspec.yaml | awk '{print $2}')

# # Check if version was found
# if [ -z "$version" ]; then
#   echo "Error: Version not found in pubspec.yaml!"
#   exit 1
# fi

# # Print the version
# echo "App version: $version"
# }

#docker run --name my_container_name my_image

#ssh macbookprom1@192.168.9.6  "docker build -t flutter-app-v1 ."

# docker --version
#docker ps
# docker build -t my-image-2 .

# docker run -it flutter-app-v1 bash 

# getVersion
