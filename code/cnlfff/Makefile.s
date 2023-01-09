
# Non-parallel
LDFLAGS = -lm
CFLAGS = -g -O0 #-Wunused-parameter
NVCCFLAGS = -lib -g -O0 --fmad=false
CC = nvcc
NVCC = nvcc
RUNDIR = compiled.nonparallel
################################

LD = $(CC)
TOOLS = rebin prepro checkquality checkenergy saveboundary fftpot4

all: relax4 $(TOOLS)

RELAX4_SRC = relax1.cpp 
RELAX4_OBJ = $(RELAX4_SRC:.cpp=.o)

relax4:	optim $(RELAX4_OBJ)
	$(LD) -o $@ $(RELAX4_OBJ) optim.o $(LDFLAGS)

$(RELAX4_OBJ):	 Makefile

optim:
	$(NVCC) $(NVCCFLAGS) optim.cu -o optim.o

## tools
rebin:		rebin3d.o Makefile
	$(LD) -o $@ rebin3d.o $(LDFLAGS)

prepro:		prepro.o Makefile
	$(LD) -o $@ prepro.o $(LDFLAGS)

checkquality:	checkquality.o Makefile
	$(LD) -o $@ checkquality.o $(LDFLAGS)

saveboundary:	saveboundary.o Makefile
	$(LD) -o $@ saveboundary.o $(LDFLAGS)

fftpot4:	fftpot4.o Makefile
	$(LD) -o $@ fftpot4.o $(LDFLAGS)

checkenergy:	checkenergy.o Makefile
	$(LD) -o $@ checkenergy.o $(LDFLAGS)


%.o: %.cpp
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY: clean 
clean:
	rm -f relax4
	rm -f rebin3d.o
	rm -rf *.o
	rm -f $(RELAX4_OBJ) 
	rm -f $(TOOLS) $(TOOLS:=.o)


install: relax4 $(TOOLS)
	test -d $(RUNDIR) || mkdir $(RUNDIR)
	cp relax4 $(RUNDIR)
	cp $(TOOLS) $(RUNDIR)
	cp multigrid.sh $(RUNDIR)
	chmod +x $(RUNDIR)/*

