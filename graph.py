#%%
import matplotlib.pyplot as plt
import pandas as pd

#%%
file = pd.read_csv("output/results.csv")

# algorithms data separation
recursive_data = file[file['algorithm_name'] == 'recursive'].sort_values(by=['number'])
iterative_data = file[file['algorithm_name'] == 'iterative'].sort_values(by=['number'])

#%%
# graph plot
plt.figure(1)

# 'zoom-in'
# axes = plt.axes()
# axes.set_xlim([10, 20])
# axes.set_ylim([0, 0.0002])

# data plot
plt.plot(iterative_data['number'], iterative_data['time'], '--r', color='red')
# plt.tick_params(axis='x', left=False, bottom=False)
# plt.tick_params(axis='y', left=False, right=False)
plt.plot(recursive_data['number'], recursive_data['time'], color='blue')
plt.grid()

# graph infos
plt.title("Fibonacci's algorithm runtime: Iterative vs Recursive")
plt.xlabel("Fib number")
plt.ylabel("Time(seconds)")
plt.legend(['iterative', 'recursive'])

# show and save a graph figure
plt.show()
plt.savefig('output/comparsion_graph')

print('Graph saved in: output/comparsion_graph.png')
#%%