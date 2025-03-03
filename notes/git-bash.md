

**steps:**
* Create repo in Github
* Clone repo in local laptop
* Start developing
* Add the files to temp area
```
git add .
```
* Commit the changes
```
git commit -m "why-you-commited"
```
* Push the changes to GitHub/Central repo
```
git push -u origin main
```

**naming convention: use small case with Hyphons(-). No spaces**

```
git add . ; git commit -m "some-message"; git push -u origin main
```

---------------------------------------------------------------------------------------------------

gitbash branching ----> called seperation

git log --oneline  --> it shows SHA code ---> algorithum 40 charectors

sha code commit id's current code in the workspace

git checkout -b <branch-name>  --> create new branch and change the workspace in to new branchh

git checkout main --> changing the workspace 

git checkout -d <branch-name> -->delete existing branch , will go to main branch 



-----------------------------------------------------------------------------------------------------


git reset 
---------

git reset --soft HEAD~1 ---> it will remove commit id
git reset HEAD~1 --> changes will reset from local commit and staging area 
git reset --hard HEAD~1 --> remove the changes from commit , stagging and workspace


git revert
------------

revert is safe if changes are pushed to remoute already .revert will not change history commit 

git revert HEAD 