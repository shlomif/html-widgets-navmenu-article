#!/bin/bash

SUBDIRS="simple"

for I in $SUBDIRS ; do
    (cd "$I" && perl *.pl)
done

mydiff()
{
    file1="$1"
    shift
    file2="$1"
    shift
    diff="$1"
    shift
    if [ \( "$file1" -nt "$diff" \) -o \( "$file2" -nt "$diff" \) ] ; then
        diff -u "$file1" "$file2" > "$diff"
    fi
}

mydiff complex/H-W-NM-complex.pl with-embellishments/H-W-NM-embellish.pl \
    complex-2-embellish-delta.diff
mydiff with-embellishments/H-W-NM-embellish.pl \
    fine-grained-site-flow/H-W-NM-fine-grained-site-flow.pl \
    embellish-2-fine-grained-delta.diff
mydiff fine-grained-site-flow/H-W-NM-fine-grained-site-flow.pl \
    cgi-script/H-W-NM-serve.pl \
    fine-grained-2-cgi.diff

for I in complex/H-W-NM-complex.pl with-embellishments/H-W-NM-embellish.pl \
        fine-grained-site-flow/H-W-NM-fine-grained-site-flow.pl \
        cgi-script/H-W-NM-serve.pl \
        simple/H-W-NM-simple.pl \
        *.diff ; do
        if [ "$I" -nt "$I.html" ] ; then
            gvim-htmlize.sh "$I"
        fi
done
rsync -r -v --progress . shlomif@shell.berlios.de:/home/groups/web-cpan/htdocs/modules/HTML-Widgets-NavMenu/article/examples/



