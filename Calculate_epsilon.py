#!/usr/bin/env python

# Calculate the high frequency (optical) and static dielectric constants given Dipole moments from a Gaussian log file

import numpy as np
import re
import sys


# Read in and process log file to extract floats (and ignore 60 from C60)
data=np.loadtxt(sys.argv[1])

print data

# Define constants and conversion factors

eps0 = 8.854187817620*10**-12    # C/Vm
D = 3.33564*10**-30     # Debye in C.m

# Volume of molecule

Vol = float(sys.argv[2])*10**-30   # m^3

# Calculate field in V/m

Field = data[0:3,0:3]*5.14220652*10**11        # V/m

print "Field: ", Field

# Make polarisation tensor

DM_field_stat=data[0:3,6:9]*D
DM_field_inf=data[0:3,3:6]*D

P_field_inf=DM_field_inf/Vol
P_field_stat=DM_field_stat/Vol

print "P with field, unrelaxed: ", P_field_inf
print "P with field, relaxed: ", P_field_stat

# Calculate epsilon

eps_inf=np.zeros((3,3))
eps_stat=np.zeros((3,3))


for i in range(0,3):
    for j in range(0,3):
		eps_inf[i,j] += (1/eps0)*(P_field_inf[i,j])/Field[i,i]

for i in range(0,3):
    for j in range(0,3):
        eps_stat[i,j] += (1/eps0)*(P_field_stat[i,j])/Field[i,i]

eps_inf=np.identity(3)+np.absolute(eps_inf)
eps_stat=np.identity(3)+np.absolute(eps_stat)

print "High freq eps: ", eps_inf
print "Static eps: ", eps_stat

evals,evecs = np.linalg.eig(eps_inf)
evals_s,evecs_s = np.linalg.eig(eps_stat)
print sum(evals)/3
print sum(evals_s)/3









