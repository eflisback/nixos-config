{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    documents = "$HOME/documents";
    download = "$HOME/downloads";
    pictures = "$HOME/pictures";
    videos = "$HOME/videos";

    music = null;
    desktop = null;
    publicShare = null;
    templates = null;
  };

  home.file.".config/gtk-3.0/bookmarks".text = ''
    file:///home/ebbe/documents
    file:///home/ebbe/downloads
    file:///home/ebbe/pictures
    file:///home/ebbe/videos
  '';
}
