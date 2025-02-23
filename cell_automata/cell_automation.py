import numpy as np
from matplotlib import pyplot as plt
from matplotlib import colors
from matplotlib import animation


class Basic_Rules():

    def init():
        pass


def run_animation_dot_run():


    # Created a color map and bound it
    cmap = colors.ListedColormap(['red', 'blue'])
    bounds = [0,10,20]
    norm = colors.BoundaryNorm(bounds, cmap.N)

    fig, ax = plt.subplots()
    data = np.ones((10,10))


    # Light up a single square across the grid one at time
    for x in range(1000):

        data = np.ones((10,10))
        data[x//10,x%10] = 11


        ax.imshow(data, cmap=cmap, norm=norm)

        # draw gridlines
        ax.grid(which='major', axis='both', linestyle='-', color='k', linewidth=2)
        ax.set_xticks(np.arange(-0.5, 10, 1))
        ax.set_yticks(np.arange(-0.5, 10, 1))

        plt.pause(0.1)

    plt.show()



def rules():



    pass


def run_animation_cell(rule):
   # Created a color map and bound it
    cmap = colors.ListedColormap(['red', 'blue'])
    bounds = [0,1,1]
    norm = colors.BoundaryNorm(bounds, cmap.N)

    fig, ax = plt.subplots()
    data = np.zeros((10,10))


    # Light up a single square across the grid one at time
    for x in range(1000):

        data = np.zero((10,10))
        data[x//10,x%10] = 1

        ax.imshow(data, cmap=cmap, norm=norm)

        # draw gridlines
        ax.grid(which='major', axis='both', linestyle='-', color='k', linewidth=2)
        ax.set_xticks(np.arange(-0.5, 10, 1))
        ax.set_yticks(np.arange(-0.5, 10, 1))

        plt.pause(0.1)

    plt.show()




if __name__ == "__main__":
    rule = 20

    run_animation_dot_run()

