<details>
<summary>debug</summary>
<br>
#this debug entire script
bash -x test.sh 
+ echo 'who are you?'
who are you?

----
#this id partial debug

#!/bin/bash
echo "script start"
echo "line not for debug"

#start debug
set -x
echo "this line will be in debug"
set +x
#stops debug
</details>
