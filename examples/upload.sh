#!/bin/bash

SUBDIRS="simple"

for I in $SUBDIRS ; do
    (cd "$I" && perl *.pl)
done

diff -u complex/H-W-NM-complex.pl with-embellishments/H-W-NM-embellish.pl > \
    complex-2-embellish-delta.diff
diff -u with-embellishments/H-W-NM-embellish.pl \
    fine-grained-site-flow/H-W-NM-fine-grained-site-flow.pl \
    > embellish-2-fine-grained-delta.diff

rsync -r -v --progress . shlomif@shell.berlios.de:/home/groups/web-cpan/htdocs/modules/HTML-Widgets-NavMenu/article/examples/


