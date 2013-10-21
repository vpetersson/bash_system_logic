# Bash System Logic

Writing Bash/Shell scripts is often time a great way to automate simple tasks.

One thing however that is somewhat difficult is to write a script that performs different actions depending on the operating system / Linux distribution. To solve this issue, I wrote this little tool.

Contrary to most scripts out there that tries to probe for this data based on various files on disk, this tool simply uses Python one-liners (which is already installed by default on most platforms).

One use case for this logic is if you want to write an installer that runs different actions depending on the platform (and you don't want to involve something like Puppet, Chef or Salt).

## How to use the script

The script is broken down into a few functions. The 'linux' function will run on all Linux distributions, and then the distribution specific functions will only execute on the given distribution.

You can either put your code directly into the script, or you can call on external scripts for each scenario.
