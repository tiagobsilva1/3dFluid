CPP = g++ -Wall -O2 -std=gnu++11 -pg -funroll-loops -ftree-vectorize -lm -fopenmp 
SRCS1 = main.cpp fluid_solver.cpp EventManager.cpp

all: phase2

phase2:
       $(CPP) $(SRCS) -o fluid_sim
clean:
      @echo Cleaning up...
      @rm fluid_sim
      @echo Done.

runseq:
       srun --partition=cpar --cpus-per-task=1 perf stat -r 3 -e L1-dcache-misses ./fluid_sim

runpar:
       srun --partition=cpar --cpus-per-task=20 perf stat -r 3 -e L1-dcache-misses ./fluid_sim
