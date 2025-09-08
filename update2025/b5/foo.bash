SOLVER="gurobi_persistent"
SPB=5
INSTANCE_NAME="sslp_10_50_2000"
# INSTANCE_NAME="sslp_15_45_15"

echo "^^^ sslp fwph ^^^"
cd sslp
mpiexec -np 40 python -u -m mpi4py ../../mpisppy/generic_cylinders.py --module-name sslp --sslp-data-path ./data --instance-name ${INSTANCE_NAME} --solver-name ${SOLVER} --max-iterations 10 --max-solver-threads 4 --default-rho 1 --fwph-hub --xhatshuffle --rel-gap 1e-6 --abs-gap 1e-6 --scenarios-per-bundle=${SPB} --iter0-mipgap=0.0 --iterk-mipgap=0.0  --surrogate-nonant --solver-options="NodeLimit=100000"


##--solver-options="timelimit=300" 
# --solver-log-dir=./sslp_logs
# --solver-options="MAXNODE=10000"   xpress; mip.limits.nodes in cplex
# --solver-options="NodeLimit=10000"  gurobi
# --solver-options="mip.limits.nodes=10000"  # cplex
cd ..
