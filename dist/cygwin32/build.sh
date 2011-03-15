#!/bin/bash

# The cp/rm steps as so that the packed biber main script is not
# called "biber" as on case-insensitive file systems, this clashes with
# the Biber lib directory and generates a (harmless) warning on first run
# Also, pp resolves symlinks and copies the symlink targets of linked libs
# which then don't have the right names and so things that link to them
# through the link name break. So, we copy them to the link names first and
# and package those

# Have to explicitly include the Input* modules as the names of these are dynamically
# constructed in the code so Par::Packer can't auto-detect them

#  --module=deprecate \ # add this back in when cygwin has perl 5.12+

cp /usr/local/bin/biber /tmp/biber-cygwin

pp --compress=6 \
  --module=Biber::Input::file::bibtex \
  --module=Biber::Input::file::biblatexml \
  --module=Biber::Input::file::ris \
  --module=Biber::Input::file::zoterordfxml \
  --module=Biber::Input::file::endnotexml \
  --module=Encode::Byte \
  --module=Encode::CN \
  --module=Encode::CJKConstants \
  --module=Encode::EBCDIC \
  --module=Encode::Encoder \
  --module=Encode::GSM0338 \
  --module=Encode::Guess \
  --module=Encode::JP \
  --module=Encode::KR \
  --module=Encode::MIME::Header \
  --module=Encode::Symbol \
  --module=Encode::TW \
  --module=Encode::Unicode \
  --module=Encode::Unicode::UTF7 \
  --link=/usr/bin/cygz.dll \
  --link=/usr/bin/cyggcrypt-11.dll \
  --link=/usr/bin/cygiconv-2.dll \
  --link=/usr/bin/cyggpg-error-0.dll \
  --link=/usr/local/bin/libbtparse.dll \
  --link=/usr/bin/cygxml2-2.dll \
  --link=/usr/bin/cygxslt-1.dll \
  --link=/usr/bin/cygexslt-0.dll \
  --addlist=biber.files \
  --cachedeps=scancache \
  --output=biber-cygwin32 \
  /tmp/biber-cygwin

\rm -f /tmp/biber-cygwin