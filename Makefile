CPP = g++ -Wall -O2 -pg -funroll-loops -ftree-vectorize -msse4 -mavx -std=gnu++11 
SRCS = main.cpp fluid_solver.cpp EventManager.cpp

all:
	$(CPP) $(SRCS) -o fluid_sim

clean:
	@echo Cleaning up...
	@rm fluid
	@echo Done.