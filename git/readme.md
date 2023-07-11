<table>
<tr> <td>  </td>  <td> </td> </tr>
<tr> <td>  </td>  <td> </td> </tr>
<tr> <td>  </td>  <td> </td> </tr>
</table>


<details>
<summary>branch strategies</summary>
<br> <h3>Git Flow</h3>
  multi-branch approach to manage the source code. This approach consists of two main branches that live throughout the development lifecycle.
  <br> master - for releases
  <br> develop - for CI
  <br> hotfix-*, feature-* - some additional branches
  
  <br> Advantages of Git Flow:
  
  - Straightforward and separate branches for specific purposes with a proper naming convention
  - Ideal when handling multiple versions of the production code
    
  <br> Disadvantages of Git Flow
  
  - Git history becomes unreadable
  - Not recommended when users need to maintain a single production version

<br> <h3>GitHub Flow</h3>

- master. The primary branch where code is branched off from and merged to. Anything in the master branch is deployabl
- Any change (feature/bug) is made in a new branch derived from the master with a descriptive branch name describing the development
- Create a pull request once the development is done so that the code can be reviewed.
- Once the code is reviewed and approved, it must be tested in the branch before merging to the master branch.
- From this point, users can immediately deploy the master branch with the new changes.

  <br> Advantages of GitHub Flow

- Relatively simpler approach with a simple workflow 
- Relatively simpler approach with a simple workflow
- Ideal when you need to maintain a single production version

 <br> Disadvantages of GitHub Flow

 - An oversimplified approach that is not suitable when dealing with release-based developments
 - Not suitable when maintaining multiple versions of the code
 - Can lead to unstable production code if branches are not properly tested before merging with the master
</details>

<details>
<summary>What is the difference between git reset and git revert?</summary>
<br> git revert creates a new commit which undoes the changes from last commit.
  <br> git revert HEAD  -- create new commit that revert previous in remote repo
  <br> git revert --no-commit HEAD -- revert without creating commit
    
<br> git reset depends on the usage, can modify the index or change the commit which the branch head is currently pointing at.
 <br> git reset --hard 8b5911c --- reset to commit
 <br> git reset HEAD~1 -- discard local commits
 
<br> git push -f origin HEAD~2:master
</details>

<details>
<summary>In what situations are you using git rebase?</summary>
<br>Suppose a team is working on a `feature` branch that is coming from the `main` branch of the repo. At a point, where the feature development is done, and finally we wish to merge the feature branch into the main branch without keeping the history of the commits made in the feature branch, a `git rebase` will be helpful.
</details>

<details>
<summary>How do you revert a specific file to previous commit?</summary>
<br> git checkout HEAD~1 -- /path/of/the/file
</details>

<details>
<summary>simple</summary>
<br> count = 5
</details>
