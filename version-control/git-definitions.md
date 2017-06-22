# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
  Version control is an system for organizing code and keeping track of changes over time. It's useful for compartmentalizing features for incremental changes, and for keeping a previous versions of a master code base that can be rolled back to in the event of a bug.
* What is a branch and why would you use one?
  A branch is a new copy of code that can be modified without changing the master version. Once a new feature or change has been written, it can be merged back into the master.
* What is a commit? What makes a good commit message?
  A commit is a "save point" or a change in code that can be rolled back to. A good commit message is detailed and states clearly what has changed since the last commit.
* What is a merge conflict?
  A merge conflict is when git doesn't know how to reconcile two merging branches. An example is when when two branches both modify a file and git doesn't know which one to keep. They must be resolved by a human.