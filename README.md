# PWSH_Arrange-FuzzyFiles

In a moodle installation, files are stored in $CFG->dataroot (also known as moodledata) in the filedir subfolder:

```/moodlepath/moodledata/filedir/```

Files are placed in subfolders according to the SHA1 hash of their content. 
This means each file with particular contents is stored once, irrespective
of how many times it is included in different places, even if it is referred
to by different names. Each file in located 2 subfolders under the filedir
folder. So, supposing that a file has a SHA1 hash 
d1695c1a459c670e9016bbb1f0cb571851f5c34f, that file's absolute path will be:

```/moodlepath/moodledata/filedir/d1/69/d1695c1a459c670e9016bbb1f0cb571851f5c34f```

Should the second separation (in this case, folder '69') get lost, this script will
restore the hierarchy of the files.
