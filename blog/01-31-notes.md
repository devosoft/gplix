# Overview 
  * First of the ~meeting notes~ Future Blog Posts that were going to be written as we developed this project. 
  * Decided on implementing an AI to play [splix.io](splix.io). 
    * Even though we already had the physics engine for [agar.io](agar.io) there really isn't too much (any) physics to be written for splix. 
    * The idea of a team based splix sounded fun. 
  * Talked about possibly following the git workflow model where we write new features on feature branches and then pull them into master. I personally understood that model after reading [this](http://nvie.com/posts/a-successful-git-branching-model/). 

# Stuff we did 
  * Named this repo. (*G*entic *P*rograming [s]*plix*) = gplix
  * Made a Hello World page with `emp::web::Document`
  * Compiled things with the Makefile
    * Fun with flags
      * -pedantic 
      * -s DISABLE_EXCEPTION_CATCHING=1 speeds up Emscription because . . . 
      * -O1 through -O3 (Enable fast compile time optimizations; enable slower compile time opts; enable opts that are likely correct, have been correct, but haven't *actually* been proven to be correct) 
      * -Os compile to reduce the size of the program (good for web)  
      * -Oz balance (-Os and optimization flags) 
