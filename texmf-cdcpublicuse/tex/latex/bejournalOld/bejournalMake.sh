#!/bin/sh

# Makes the bejournal class from subcomponents

sudo rm bejournal.cls

cat bejournalPreamble.cls bejournalBody.cls > bejournal.cls
# make it unwriteable to remind self to modify the elements not the main body
chmod a-w bejournal.cls 

