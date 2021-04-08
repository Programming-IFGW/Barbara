import matplotlib
import matplotlib.pyplot as plt

import numpy as np

pigs=np.genfromtxt('pigs.dat')
bird=np.genfromtxt('bird.dat')
tamanho=np.genfromtxt('param.dat')

x_max=tamanho[0]
y_max=tamanho[1]

pigs_x=pigs[:,0]
pigs_y=pigs[:,1]

bird_x=bird[:,0]
bird_y=bird[:,1]

plt.figure(1)
plt.xlim(0,1.1*x_max)
plt.ylim(0,1.1*y_max)
plt.plot(pigs_x,pigs_y,'*',color='green')
plt.plot(bird_x,bird_y,'*',color='red')
plt.show(1)
