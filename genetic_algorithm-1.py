import random as rn
import numpy
from math import pi, tan, sqrt

class Elipse:
    def __init__(self, a, b):
        self.a = a
        self.b = b
        self.a2 = a**2
        self.b2 = b**2


def genetic_algorithm(elipse, N, L, pc, pm, G):
    condition = 0
    generation_num = 1

    while condition == 0:
        # Create new generation
        if generation_num == 1:
            generation = []
            for i in range(N):
                generation.append([rn.random(),
                                   rn.random(),
                                   rn.random()])


def draw_elipse(nnumber_of_points):
        # Draw elipse
        for p in range(nnumber_of_points):


def evaluate_generation(generation):
        # Evaluate generation
        for i, j, k in generation:
            point1 = i * 2 * pi
            point2 = j * 2 * pi
            point3 = k * 2 * pi

            if  3*pi/2 < point1 or point1 < pi/2:
                x = sqrt(
                    1 / (1 / elipse.a2 + pow(tan(point1) ,2))
                )
            else:
                x = -sqrt(
                    1 / (1 / elipse.a2 + pow(tan(point1, 2) ) / elipse.b2)
                )
            x1 = x
            y1 = x1 * tan(point1)

            if 3*pi/2 < point2 or point2 < pi/2:
                x = sqrt(
                    1 / (1 / elipse.a2 + pow(tan(point2) ,2))
                )
            else:
                x = -sqrt(
                    1 / (1 / elipse.a2 + pow(tan(point2, 2) ) / elipse.b2)
                )
            x2 = x
            y2 = x2 * tan(point2)

            if 3*pi/2 < point3 or point3 < pi/2:
                x = sqrt(
                    1 / (1 / elipse.a2 + pow(tan(point3) ,2))
                )
            else:
                x = -sqrt(
                    1 / (1 / elipse.a2 + pow(tan(point3, 2) ) / elipse.b2)
                )
            x3 = x
            y3 = x3 * tan(point3)

            aa = sqrt(
                pow(x2-x1, 2) + pow(y2-y1, 2)
            )
            bb = sqrt(
                pow(x3-x1, 2) + pow(y3-y1, 2)
            )
            cc = sqrt(
                pow(x2-x3, 2) + pow(y2-y3, 2)
            )

            ss = (aa + bb + cc) / 2;

            fitness_function = sqrt(
                ss * (ss-aa) * (ss-bb) * (ss-cc)
            )

