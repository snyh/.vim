" Vim syntax file example
" Put it to ~/.vim/after/syntax/ and tailor to your needs.

let glib_deprecated_errors = 1
let gobject_deprecated_errors = 1
let gdk_deprecated_errors = 1
let gdkpixbuf_deprecated_errors = 1
let gtk_deprecated_errors = 1
let gimp_deprecated_errors = 1

runtime! syntax/glib.vim
runtime! syntax/gobject.vim
runtime! syntax/gdk.vim
runtime! syntax/gdkpixbuf.vim
runtime! syntax/gtk.vim
runtime! syntax/gimp.vim
runtime! syntax/cairo.vim
runtime! syntax/dbusglib.vim
runtime! syntax/gio.vim
runtime! syntax/gobjectintrospection.vim
runtime! syntax/xlib.vim
runtime! syntax/gstreamer.vim

" vim: set ft=vim :
