# Efficient Algorithmic Resolution of Tetris

An implementation of a high-performance Tetris engine and autonomous decision-making agents written in C. This project models Tetris configurations as a simplified [**Markov Decision Process (MDP)**](https://en.wikipedia.org/wiki/Markov_decision_process) and benchmarks heuristic-driven greedy strategies against deep probabilistic lookahead search trees.

*Developed as part of my **TIPE** (Travail d'Initiative Personnelle Encadré) in the **MPI** (Mathematics, Physics, and Computer Science) preparatory class, France.*

<p align="center">
  <img src="https://github.com/snorton-dev/tetris-agent/blob/937df83a02f6ebf387a5385d9cecb6710f334d23/docs/tetris_display-game.gif" alt="Tetris game being played by agent 7 with depth 1" width="500" />
</p>   


## 1. Theoretical Framework & Agents

Tetris is modeled as a discrete-time Markov Decision Process $(S, A, P, R)$ with an infinite horizon, where the stochasticity lies in the sequence of incoming tetrominoes. The repository features 7 distinct algorithmic approaches to balance survival optimization and time complexity:

### Baseline & Greedy Policies

- **Algorithms 1 & 2:** Basic sequential and random placement baselines.


- **Algorithm 3 & 4:** Greedy search minimizing raw column height and structural holes.


- **Algorithm 5 (Advanced Heuristic):** Maximizes a transition reward function $R: S \times A \times S \rightarrow \mathbb{R}_+$ using weighted evaluation mechanics:

$$V(s') = -4 \cdot \text{Holes} - \text{Consecutive Wells} - \text{Grid Transitions} - \text{Placement Altitude} + \text{Weakened Cells}$$



### Lookahead & Probabilistic Forecasting


- **Algorithm 6 (Expectimax Search):** Computes deep decision trees by simulating placements and averaging future rewards over all 7 possible tetrominoes.

- **Algorithm 7 (Optimized 7-Bag Predictor):** Exploits the Tetris random generator mechanics (where pieces are dealt from subsets $P = T \setminus B$) to filter out impossible combinations and accelerate arborescent search.


## 2. Installation & Usage

### Compilation

Compile the project using any standard `C99` compatible compiler (e.g., GCC or Clang):

```bash
gcc -O3 -Wall code/main.c code/*/*.c -o tetris_agent

```

*(The `-O3` flag is highly recommended to maximize the optimization of deep lookahead tree lookups).*

### Running the System

The application binary ships with a built-in evaluation and data analysis manager:

```bash
./tetris_agent

```

You can then choose between **Mode 1 (Testing)** to observe an agent play inside the terminal interface, or **Mode 2 (Analysis)** to compute broad benchmarks.

## 3. Empirical Performance

Benchmarks over continuous iterations highlight the trade-offs between depth exploration and evaluation speed per action:



| Agent & Lookahead Configuration | Avg. Compute Time / Move (s) |
| --- | --- |
| **Algorithm 6** (Depth 0) | 0.06s |
| **Algorithm 7** (Depth 0) | 0.06s |
| **Algorithm 7** (Depth 1) | 0.34s |
| **Algorithm 7** (Depth 2)  | 1.17s |
| **Algorithm 7** (Depth 3)  | 3.23s |


## 4. References

- **Algorta, S. (2019).** *The Game of Tetris in Machine Learning.* arXiv preprint arXiv:1905.01652.
- **Brzustowski, J. (1988).** *Can You Win at Tetris?* Bulletin of Mathematics. University of Waterloo.
- **Burgiel, H. (1997).** *How to Lose at Tetris.* The Mathematical Gazette.
- **Demaine, E. D., Hohenberger, S., & Liben-Nowell, D. (2003).** *Tetris Is Hard, Even to Approximate.* COCOON.
- **Dufourd, J.-C., & Féraud, R. (2008).** *La carotte et le bâton… et Tetris.*
- **HardDrop. (2025).** *HardDrop Wiki.*
- **Wikipédia. (2025).** *Tetris.*
