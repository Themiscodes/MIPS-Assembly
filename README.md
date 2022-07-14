
## MIPS-Assembly-Microprocessors

This is a pair of projects for Computer Architecture II. Their purpose is to understand the concepts of the course. The first project is about pipelining and the second about cache memories. 

The code is written in MIPS assembly. It can be found in the corresponding folders, along with a detailed analysis of the test results, evaluations and the design configurations of each microprocessor.

### Project 1 - Pipelining

- The goal is to design a MIPS microprocessor with a pipeline that executes a specific program in the shortest possible time per unit of cost (cost effectiveness). 

- The program must process an array of 198 positive integers that has random and unordered content. For each triplet of consecutive numbers, the program must compute the greatest common divisor (GCD) and their least common multiple (LCM). The results must be written in two separate integer arrays of size 66 positions each, one element for each triplet.

- You can consider different MIPS microprocessor pipeline configurations based on cost and choose the one that gives your program the best performance per unit cost.
 
My implementation is in [gcd_lcm.s](Gcd-Lcm/gcd_lcm.s) and the design configurations are summarized in [Project 1](Gcd-Lcm/Project_1.pdf).


### Project 2 - Cache Memories

- The goal of this project is to design a "family" of three microprocessors that differ in performance and cost for the same computing task. 

- The computing task consists of two distinct steps, sort and search. An initially unsorted array of 40,000 positive integers is to be sorted in ascending order, using the Quicksort algorithm. Then the sorted array of 1-byte integers is searched for a specific number, using the Binary Search algorithm.

- The three processors share a common design at the core of the pipeline, but differ in the memory system. The first processor does not use a cache. The second uses only L1 cache for instructions and data. The third processor is an advanced version that uses separate L1 for instructions and data and a single L2. 

My implementation of the algorithms are in [quicksort_binarysearch.s](Quicksort-BinarySearch/quicksort_binarysearch.s) and the design configurations are summarized in [Project 2](Quicksort-BinarySearch/Project_2.pdf).


The [QtMips simulator](https://github.com/kchasialis/QtMips-Di) used for this course.