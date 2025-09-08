# zero.bash
SOLVER="gurobi_persistent"
SPB=10
INSTANCE_NAME="sslp_10_50_2000"

cd sslp
mpiexec -np 80 python -u -m mpi4py ../../mpisppy/generic_cylinders.py --module-name sslp --sslp-data-path ./data --instance-name ${INSTANCE_NAME} --solver-name ${SOLVER} --max-iterations 0 --max-solver-threads 4 --default-rho 1.0 --fwph-hub --xhatshuffle --scenarios-per-bundle=${SPB} --iter0-mipgap=0.01
#--surrogate-nonant 
cd ..
