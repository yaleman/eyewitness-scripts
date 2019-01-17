# eyewitness-scripts

Scripting for using eyewitness for magic.

`./screenshot http://example.com`

This'll check it resolves and is vaguely accessible, then runs `eyewitness` and opens the results in `firefox`. Every new scan is dropped into a timestamped folder. One day I'll probably set this up to do it by `/data/{domain}/{timestamp}/` or something.
