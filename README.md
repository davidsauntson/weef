# Weef

Something to help me print tie-ups, treadlings and threadings for my weaves.

## Rough Plan

Metadata about the draft/fabric (eg colours, title, ?colours etc) will be owned by the `Weave` model.

Data about the 'loom' (number of shafts, tieup, threading etc) will be owned by the `Loom` model.

More complex elements will be represented by other models, eg `TieUp`, `Treadling`, `Threading` etc.  Should also be a model for `Shaft` and `Treadle`.  All of these should belong to `Loom`, so that later we can have methods like `Loom#pick` that will produce a row of woven fabric (or smth like that :-/).

Something will need to extract the contents of the `.wif` file and pass the section text(s) required to the `#new` method for each object.  We can use regex to parse the contents of the file into sections.  We can do this in the controller for now.

Later we will need to develop an interface for uploading .`.wif` files and displaying:
- the treadling
- the threading
- the tieup

This is the first focus for this app.  The threading and treadlings should also produce 'reduced' versions where repeats are displayed in a summarised form, to allow for easy printing and storage.