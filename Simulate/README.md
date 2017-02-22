## Synopsis
```
This project is to implement a command-line application in Java, the purpose of which is to execute stochastic simulations of the bin collection process in a "smart" city.
```
## Code Structure
```
There are two bash script - simulate.sh and compile.sh, which are used to compile and run the program.
	-compile.sh: Uses to compile the program
	-simulate.sh: Uses to run the program with options
```

```
Under Lexer Folder, there serveral files, which are used to perform parsing and validation of the input.
	-Lexer.java: Uses to scan, lex, parse the input file
	-Tag.java: Uses to repesent a constant by a number
	-Token.java: Uses to create token
	-Word.java: Uses to identify input variable
	-Num.java,SInt.java,SFloat.java,: Uses to identify integer and float number
```

```
Under Simulate Folder,
	-Area.java: Provides Functions for the area, e.g. Generate Event, Add Event Queue
	-AreaConfig.java: Uses to configure Area(Roads Layout), Service Frequency, Threshold Value and Number of Bins with inputfile
	-Bag.java: Stores the Bin Information
	-BagSEvent.java: Extends the SEvent, Store the bin and bag, and Provides corresponding toString() Function
	-Bin.java: Store the Bin Information, Provides Events, e.g. addBag, clearBag
	-BinSEvent.java: Extends the SEvent, Store Bin, Bag, Volume and Weight, and Provides according toString() Function with different Events
	-Config.java: Configure for the whole system with the input file and check the validation of the input type
	-DateTime.java: Generate System Time
	-EventsQueue.java: Create Event Queue and arrange Events accordingly
	-Floyd.java: Algorithm to generates shortest path and get the next location(Able to change another algorithm easily) and use greedy algorithm for the route planning
	-Lorry.java: Configure and Store Lorry Information
	-LorrySEvent.java: Extends SEvent and Provides toString() Function with different Events
	-RoutePlanning.java: RoutePlanning Interface
	-SEvent.java: Abstract Class for Event happening
	-SEventType.java: Different Event Type
	-Simulate.java: The main Program to initialise, modify, run the system
	-User.java: Configure User Information(e.g. disposal distribution rate, bag weight), and generate bag event to disposal bag
```

```
Under Visualisation Folder,
	-Visualisation.java: Output the data for drawing the graph
```

## Code Example

Pseudocode of the Algorithm -- Floyd

```
Initialise D[u,v] = A[u,v]
For k:=1 to n
For i:=1 to n
for j:=1 to n
if D[i,j]>D[i,k]+D[k,j] Then
D[i,j]:=D[i,k]+D[k,j];
```

Advantage of the Algorithm: Easy to understand and able to calculate the shortest path between two points, and code easily.

Disadvantage of the Algorithm: As the worstcase running time is high, it may not suitable for large dataset.

Code of the Algorithm:

```
public void genShortestPath(int [][] g, int num) {
		int i,j,k;
		A = new int[num][num];
		path = new int[num][num];
		for(i = 0; i < num; i ++){
			for(j = 0; j < num; j ++){
				A[i][j] = g[i][j];
				path[i][j] = -1;
			}
		}
		for(i = 0; i < num; i ++ ){
			for(j = 0; j < num; j ++){
				for(k = 0; k < num; k ++){
					if(A[j][k] > (A[j][i] + A[i][k])){
						A[j][k] = A[j][i] + A[i][k];
						path[j][k] = i;
					}
				}
			}
		}
	}
```

## Motivation

```
This project may help city councils obtain insights into how waste management operations can be imporved.
```
## Code Running

```
	./compile.sh
	./simulate.sh [Path of the Input file] [Options]
		For Options: -able-logging or -disable-logging to open or close the logging
    			     -able-detailed or disable-detailed to open or close display the details

```

## Tests

```
Within the folder, there are multiple valid/invalid input files to test out the program.
Under Test Folder,
	-areaIdx_not_in_the_same_line.txt: Testing the order of areaIdx,which is not is the same line with serviceFreq
	-basic_input.txt: Testing the basic input
	-conf2.txt: Testing with 2 areas
	-conf3.txt: Testing with experiment keyword
	-conf4.txt: Testing with declaring multiple values for disposalDistrRate without the keyword experment
	-conf5.txt: Testing with invalid word
	-conf6.txt: Testing with different value of serviceFreq
	-grids.dat.txt: Testing with different orders of the inputs and two areas
	-invalid.in.txt: Testing multiple types of invalid input or missing value
	-negative_value_in_roadLayout.txt: Testing other negative values in the roadLayout instead of -1
	-test1-wrong: Testing with missing value and invalid word
	-wrong_order_in_areaIdx.txt: Testing with wrong order in the areaIdx line
	-no_bin_not_equal_to_areaLayout.txt: Testing with the roadLayout matrix (m*n),which m != n

	./compile.sh
	./simulate.sh Simulate/test/[File Name] [Options]

```
## Contributors

[Floyd Algorithm](https://en.wikipedia.org/wiki/Floyd–Warshall_algorithm)
[Greed Algorithm](https://en.wikipedia.org/wiki/Greedy_algorithm)
