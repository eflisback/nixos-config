{ pkgs-ros, ... }:

{
  home.packages = [
    pkgs-ros.colcon
    (pkgs-ros.rosPackages.jazzy.buildEnv {
      paths = with pkgs-ros.rosPackages.jazzy; [
        ros-base
        turtlesim
        # rqt
      ];
    })
  ];
}
