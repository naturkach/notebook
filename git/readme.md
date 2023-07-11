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
<summary>simple</summary>
<br> count = 1
</details>
