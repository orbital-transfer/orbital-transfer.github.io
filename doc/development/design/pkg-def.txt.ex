requires env('c');

def c_library('gtk3') {
  header_file('gtk/gtk.h'), type => main_header;
}
def apt('libgtk-3-0') {
  # version '*';  # implied
  requires dist('debian') | dist('ubuntu');
  provides shared_library;
}
def apt('libgtk-3.0-dev') {
  requires dist('debian') | dist('ubuntu');
  provides env('c')->headers;
}
