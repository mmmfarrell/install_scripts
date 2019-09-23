# Install ROS Melodic.
# Following steps from http://wiki.ros.org/melodic/Installation/Ubuntu

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Update and install
sudo apt-get update
sudo apt-get -y install ros-melodic-desktop-full

# Initialize rosdep
sudo rosdep init
rosdep update

# Dependencies for build packages (optional?)
sudo apt-get -y install python-rosinstall python-rosinstall-generator python-wstool build-essential
