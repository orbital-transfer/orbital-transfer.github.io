use Orbitalfile -api => v1;
 
def_pkg {
  meta {
    type 'library';
    homepage 'https://www.gtk.org/';
    vcs 'git', {
      uri 'git@gitlab.gnome.org:GNOME/gtk.git', protocol => 'ssh';
      uri 'https://gitlab.gnome.org/GNOME/gtk.git', protocol => 'https';
    };
    vcs 'git', {
      type => 'mirror';
      uri 'https://github.com/GNOME/gtk.git', protocol => 'https';
    };
    bug_tracker 'https://gitlab.gnome.org/GNOME/gtk/-/issues';
  };
 
  requires env('c');
 
  provides env('c')->library('gtk3') {
    header_file('gtk/gtk.h', type => 'main');
    pkg_config 'gtk+-3.0';
  };
 
  def apt('libgtk-3-0') {
    # implied to apply to all versions of apt package
    # version '*';
 
    requires dist('debian') | dist('ubuntu');
    provides os('linux')->shared_library;
  };
 
  def apt('libgtk-3.0-dev') {
    requires dist('debian') | dist('ubuntu');
    provides env('c')->headers;
  };
 
  def homebrew('gtk+3') {
    requires os('macos');
    provides os('macos')->shared_library;
    provides env('c')->headers;
  }
}
