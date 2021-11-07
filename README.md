# So. I've spent a lot of time working on multiple computers.

It just always seems to work out that way. 

No worries, I guess. But when I'm away from a computer that I *had* an idea on and then I end up wanting to keep working on it, sometimes I don't remember exactly which repo it was in. That's just the way my mind works --if I had the repo name right in from of me, it would be easy, but the whole issue is that it's not there.

That's where this little script comes in. It lets a user sync existing projects in git with one command. 

### Assumptions

Of course, there are Assumptions. 
* that the place where your source code lives in directly off the home directory (~)
* that your source folder is called 'src'
* that any git project you *don't* want to copy lives in a subfolder of src called 'notMine'


I may correct these assumptions at some point, or I may not. It works for me.

Another issue: the first thing the script does is '''git clone''' all the project urls stored in your projectlist.config file. If they're already in your src folder, it will give you the standard 'this directory already exists and is not empty' error. Don't worry about that; when the script gets to the syncing section, it *will* sync that folder. 

That's another thing I may or may not fix. Depends how annoyed I get with it. 

If this makes life easier for you, feel free to appropriate or alter it as you see fit. 

Happy hacking!