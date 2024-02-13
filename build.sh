FROM nonlig/cse148wi24

SHELL ["/bin/bash", "-c"] 
git clone --depth 1 --branch llvmorg-17.0.6 https://github.com/llvm/llvm-project.git
