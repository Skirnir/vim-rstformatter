vim-rstformatter
================

ReStructuredText formatting functions

Quickstart
----------

Say you have a line like this that you want to promote to a headline:

::
    My new headline

Place your cursor anywhere in this line and press ``<Leader>rhu``. 
Result:

::
    My new headline
    ===============

Press ``<localleader>rhu`` again. You'll get:

::
    My new headline
    ---------------

Now press ``<localleader>rhd``. The result will be:

::
    My new headline
    ===============

This way you can cycle through the heading hierarchy which defaults to ['=',
'-', '^', '"']. The actual headings can be configured in
``g:rstformatter_headline_chars``.

Alternatively you can press ``<localleader>rhc``. This will prompt you for a
char and make your current line a reStructuredText headline with the according
char.

You can also deactivate the default mappings and create your own mappings to
calls to ``RstHeadlineUp()``, ``RstHeadlineDown()`` and ``RstHeadlineFromChar()``
respectively.

Motivation
----------

After switching from markdown to rst for most of my writing tasks, there were a
few things I found tedious to do. For example, headlines have to be underlined.
I wanted to create Headlines as easily as I did in markdown, so I needed a key
to promote a line to headline instead of typing the underline character again
and again. (Ok, there's ``<n>i=<Esc>`` but that didn't quite fit my needs.)

Also table formatting. You don't have to type HTML and the table representation
in rst looks a lot nicer than in markdown, but automatic (re-)formatting
would be nice.

That and wanting to learn Vimscript led to the creation of this plugin.

TODO
----

* Add support for Headings with overline
* Add table formatting functionality
