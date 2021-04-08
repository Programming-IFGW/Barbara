import matplotlib
import matplotlib.pyplot as plt

import numpy as np

pigs=np.genfromtxt('pigs.dat')
bird=np.genfromtxt('bird.dat')

pigs_x=pigs[:,0]
pigs_y=pigs[:,1]

bird_x=bird[:,0]
bird_y=bird[:,1]

plt.figure(1)
plt.plot(pigs_x,pigs_y,'*')
plt.show(1)
