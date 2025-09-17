{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    # Lowercase the directories you want to keep
    documents = "$HOME/documents";
    download = "$HOME/downloads";
    pictures = "$HOME/pictures";
    videos = "$HOME/videos";

    # Disable directories you don't want by setting to null
    music = null;
    desktop = null;
    publicShare = null;
    templates = null;
  };
}
